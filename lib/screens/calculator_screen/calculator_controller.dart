import 'dart:async';
import 'dart:developer';

import 'package:calculator_frontend/generated/operation.pb.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/display_model.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/display_text_model.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/result.dart';
import 'package:calculator_frontend/service/calculator_service.dart';
import 'package:calculator_frontend/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/calculator_button/calculator_button_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorControllerProvider = Provider(
  (ref) => CalculatorController(ref),
);

/// state providers
final primaryDisplayStateProvider = StateProvider(
  (_) => DisplayModel.empty,
);

final secondaryDisplayStateProvider = StateProvider(
  (_) => DisplayModel.empty,
);

enum DisplayType {
  primary,
  secondary,
}

class CalculatorController {
  static const _tag = 'CalculatorController';

  final Ref _ref;
  final _service = CalculatorService();

  CalculatorController(this._ref);

  String operandA = '';
  String operandB = '';

  OperatorType? operatorType;
  String operatorTypeString = '';

  bool _equalsCalled = false;
  bool _factorizationActive = false;
  bool _averageActive = false;

  /// utility methods
  final _formatter = NumberFormat('#,##,###.${'#' * 10}');
  final _resultFormatter = NumberFormat('#,##,###');

  void _writeErrorToDisplay({
    required String message,
    required DisplayType displayType,
  }) {
    _writeToDisplay(
      model: DisplayModel(
        textModels: [
          DisplayTextModel(
            text: message,
            color: AppColors.red,
          ),
        ],
      ),
      displayType: displayType,
    );
  }

  void _writeToDisplay({
    required DisplayModel model,
    required DisplayType displayType,
  }) {
    switch (displayType) {
      case DisplayType.primary:
        _ref.read(primaryDisplayStateProvider.notifier).state = model;
        break;

      case DisplayType.secondary:
        _ref.read(secondaryDisplayStateProvider.notifier).state = model;
        break;
    }
  }

  String _getFormattedText(String operand) {
    if (operand.contains('.')) {
      final tmp = operand.split('.');
      return '${_getFormattedText(tmp[0])}.${tmp[1]}';
    } else {
      return _formatter.format(double.parse(operand));
    }
  }

  DisplayOperationType get _displayOperationType {
    if (_factorizationActive) return DisplayOperationType.factorization;
    if (_averageActive) return DisplayOperationType.average;
    return DisplayOperationType.none;
  }

  void _writeInputToDisplay() {
    if (operatorType == null) {
      _writeToDisplay(
        model: DisplayModel(
          operationType: _displayOperationType,
          textModels: [
            DisplayTextModel(
              text: _getFormattedText(operandA),
            ),
          ],
        ),
        displayType: DisplayType.primary,
      );
    } else {
      _writeToDisplay(
        model: DisplayModel(
          textModels: [
            DisplayTextModel(
              text: _getFormattedText(operandA),
            ),
            DisplayTextModel(
              text: ' $operatorTypeString ',
              color: AppColors.red,
            ),
            if (operandB.isNotEmpty)
              DisplayTextModel(
                text: _getFormattedText(operandB),
              ),
          ],
        ),
        displayType: DisplayType.primary,
      );
    }
  }

  /// handle button press

  void onButtonPress(CalculatorButtonModel model) {
    if (_equalsCalled) {
      _equalsCalled = false;
      _clear();
    }

    switch (model.operatorType) {
      case OperatorType.add:
        return _add(model);

      case OperatorType.subtract:
        return _subtract(model);

      case OperatorType.divide:
        return _divide(model);

      case OperatorType.multiply:
        return _multiply(model);

      case OperatorType.equals:
        return _equals();

      case OperatorType.dot:
        return _dot(model);

      case OperatorType.number:
        return _number(model);

      case OperatorType.factorize:
        return _factorize(model);

      case OperatorType.average:
        return _average(model);

      case OperatorType.max:
        return _max(model);

      case OperatorType.clear:
        return _clear();
    }
  }

  /// button press actions

  void _operation({
    required CalculatorButtonModel model,
    required OperatorType type,
  }) {
    if (_factorizationActive || _averageActive) return;
    if (operandA.isEmpty) return;

    operatorType = type;

    operatorTypeString = model.label;
    _writeInputToDisplay();
  }

  void _add(CalculatorButtonModel model) {
    _operation(model: model, type: OperatorType.add);
  }

  void _subtract(CalculatorButtonModel model) {
    _operation(model: model, type: OperatorType.subtract);
  }

  void _divide(CalculatorButtonModel model) {
    _operation(model: model, type: OperatorType.divide);
  }

  void _multiply(CalculatorButtonModel model) {
    _operation(model: model, type: OperatorType.multiply);
  }

  String _formatResult(double res) {
    final tmp = res.toString();
    final t1 = _resultFormatter.format(res);

    /// unncessary .0 check
    if (tmp.endsWith('.0')) {
      return t1;
    }

    return '$t1.${tmp.split('.')[1]}';
  }

  void _handleOperateResult(Result result) {
    /// write primary display's content to the secondary display
    final primaryDisplayModel = _ref.read(primaryDisplayStateProvider);
    _writeToDisplay(
      model: primaryDisplayModel,
      displayType: DisplayType.secondary,
    );

    late String res;

    if (result.error != null) {
      res = result.error!;
    } else if (result.result != null) {
      res = _formatResult(result.result!);
    } else {
      res = 'ERROR';
    }

    /// write result to the primary display
    _writeToDisplay(
      model: DisplayModel(
        textModels: [
          DisplayTextModel(
            text: res,
            color: result.error != null ? AppColors.red : null,
          ),
        ],
      ),
      displayType: DisplayType.primary,
    );
  }

  Future<void> _handleEqualsOperations() async {
    final result = await _service.operate(
      operandA: double.parse(operandA),
      operandB: double.parse(operandB),
      operatorType: operatorType!,
    );

    _handleOperateResult(result);
  }

  Future<void> _handleEqualsFactorization() async {
    _factorizationActive = false;

    /// write `Factorize( ... )` to secondary display
    _writeToDisplay(
      model: DisplayModel(
        textModels: [
          const DisplayTextModel(
            text: 'Factorize(',
            color: AppColors.green,
          ),
          _ref.read(primaryDisplayStateProvider).textModels.first,
          const DisplayTextModel(
            text: ')',
            color: AppColors.green,
          ),
        ],
      ),
      displayType: DisplayType.secondary,
    );

    /// write first factorization value primary
    _writeToDisplay(
      model: const DisplayModel(
        textModels: [
          DisplayTextModel(text: '1'),
        ],
      ),
      displayType: DisplayType.primary,
    );

    final result = await _service.factorize(
      n: int.parse(operandA),
      onGet: (factor) {
        final oldModels = _ref.read(primaryDisplayStateProvider).textModels;
        _writeToDisplay(
          model: DisplayModel(textModels: [
            ...oldModels,
            const DisplayTextModel(
              text: ' × ',
              color: AppColors.red,
            ),
            DisplayTextModel(text: _formatResult(factor.toDouble())),
          ]),
          displayType: DisplayType.primary,
        );
      },
    );

    if (result?.error != null) {
      _writeErrorToDisplay(
        message: result!.error!,
        displayType: DisplayType.primary,
      );
    }
  }

  void _handleEqualsAverage() async {
    if (operandA.isNotEmpty) {
      _averageStreamController?.add(double.parse(operandA));
      await Future.delayed(Duration.zero);
    }

    /// close the steram controller
    _averageStreamController?.close();
  }

  void _handleAverageResult(Result result) {
    log('$_tag:: _handleAverageResult : $result');

    // final avgText = _ref.read(secondaryDisplayStateProvider);

    final textModels = _ref.read(secondaryDisplayStateProvider).textModels;

    if (operandA.isNotEmpty) {
      textModels.add(
        DisplayTextModel(
          text: _formatResult(double.parse(operandA)),
        ),
      );
    } else if (textModels.isNotEmpty) {
      textModels.removeLast();
    }

    /// write `Average( ... )` to secondary display
    _writeToDisplay(
      model: DisplayModel(
        textModels: [
          const DisplayTextModel(
            text: 'Average(',
            color: AppColors.green,
          ),
          ...textModels,
          const DisplayTextModel(
            text: ')',
            color: AppColors.green,
          ),
        ],
      ),
      displayType: DisplayType.secondary,
    );

    /// write result to primary display

    if (result.error != null) {
      return _writeErrorToDisplay(
        message: result.error!,
        displayType: DisplayType.primary,
      );
    }

    if (result.result != null) {
      return _writeToDisplay(
        model: DisplayModel(
          textModels: [
            DisplayTextModel(
              text: _formatResult(result.result!),
            ),
          ],
        ),
        displayType: DisplayType.primary,
      );
    }

    _writeErrorToDisplay(
      message: Result.generalError,
      displayType: DisplayType.primary,
    );
  }

  /// this method talks to the server via GRPC to get the response
  void _equals() async {
    _equalsCalled = true;

    if (operatorType == OperatorType.add ||
        operatorType == OperatorType.subtract ||
        operatorType == OperatorType.multiply ||
        operatorType == OperatorType.divide) {
      return _handleEqualsOperations();
    }

    if (_factorizationActive) return _handleEqualsFactorization();

    if (_averageActive) return _handleEqualsAverage();
  }

  void _dot(CalculatorButtonModel model) {
    if (operatorType == null) {
      if (!operandA.contains('.')) operandA = '$operandA${model.label}';
    } else {
      if (!operandB.contains('.')) operandB = '$operandB${model.label}';
    }

    _writeInputToDisplay();
  }

  void _number(CalculatorButtonModel model) {
    if (operatorType == null) {
      operandA = '$operandA${model.label}';
    } else {
      operandB = '$operandB${model.label}';
    }

    _writeInputToDisplay();
  }

  void _factorize(CalculatorButtonModel model) {
    /// first clear everything, then start factorization
    _clear();

    _factorizationActive = true;

    /// write to primary display to notify factorization mode
    _writeToDisplay(
      model: const DisplayModel(
        textModels: [
          DisplayTextModel(
            text: '0',
            color: Colors.transparent,
          )
        ],
        operationType: DisplayOperationType.factorization,
      ),
      displayType: DisplayType.primary,
    );
  }

  StreamController<double>? _averageStreamController;
  void _average(CalculatorButtonModel model) async {
    if (_averageActive) {
      if (operandA.isEmpty) return;

      final operand = double.parse(operandA);

      /// average is already active, keep adding the values
      if (operandA.isNotEmpty) {
        _averageStreamController?.add(operand);
      }

      /// write the correct output to the display
      final model = _ref.read(secondaryDisplayStateProvider);
      _writeToDisplay(
        model: DisplayModel(
          operationType: model.operationType,
          textModels: [
            ...model.textModels,
            DisplayTextModel(text: _formatResult(operand)),
            const DisplayTextModel(text: ', '),
          ],
        ),
        displayType: DisplayType.secondary,
      );

      _writeToDisplay(
        model: const DisplayModel(
          operationType: DisplayOperationType.average,
          textModels: [
            DisplayTextModel.empty,
          ],
        ),
        displayType: DisplayType.primary,
      );

      operandA = '';
    } else {
      /// first clear everything, then start average
      _clear();

      _averageActive = true;

      /// write to display to notify average mode
      _writeToDisplay(
        model: const DisplayModel(
          textModels: [
            DisplayTextModel.empty,
          ],
          operationType: DisplayOperationType.average,
        ),
        displayType: DisplayType.primary,
      );

      _averageStreamController = StreamController();
      final resp = await _service.average(
        stream: _averageStreamController!.stream,
      );

      _handleAverageResult(resp);
    }
  }

  void _max(CalculatorButtonModel model) {}

  void _clear() {
    operandA = '';
    operandB = '';
    operatorType = null;

    _factorizationActive = false;
    _averageActive = false;

    _writeToDisplay(
      model: DisplayModel.empty,
      displayType: DisplayType.primary,
    );

    _writeToDisplay(
      model: DisplayModel.empty,
      displayType: DisplayType.secondary,
    );
  }
}
