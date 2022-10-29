import 'package:calculator_frontend/screens/calculator_screen/models/calculator_display_model.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/calculator_text_display_model.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/result.dart';
import 'package:calculator_frontend/service/calculator_service.dart';
import 'package:calculator_frontend/themes/app_colors.dart';
import 'package:intl/intl.dart';

import 'widgets/calculator_button/calculator_button_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorControllerProvider = Provider(
  (ref) => CalculatorController(ref),
);

/// state providers
final primaryDisplayStateProvider = StateProvider(
  (_) => CalculatorDisplayModel.empty,
);

final secondaryDisplayStateProvider = StateProvider(
  (_) => CalculatorDisplayModel.empty,
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

  /// utility methods
  final _formatter = NumberFormat('#,##,###.${'#' * 10}');
  final _resultFormatter = NumberFormat('#,##,###');

  void _writeToDisplay({
    required CalculatorDisplayModel model,
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

  void _writeInputToDisplay() {
    if (operatorType == null) {
      _writeToDisplay(
        model: CalculatorDisplayModel(
          textModels: [
            CalculatorTextDisplayModel(
              text: _getFormattedText(operandA),
            ),
          ],
        ),
        displayType: DisplayType.primary,
      );
    } else {
      _writeToDisplay(
        model: CalculatorDisplayModel(
          textModels: [
            CalculatorTextDisplayModel(
              text: _getFormattedText(operandA),
            ),
            CalculatorTextDisplayModel(
              text: ' $operatorTypeString ',
              color: AppColors.red,
            ),
            if (operandB.isNotEmpty)
              CalculatorTextDisplayModel(
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
        // TODO: Handle this case.
        break;
      case OperatorType.average:
        // TODO: Handle this case.
        break;
      case OperatorType.max:
        // TODO: Handle this case.
        break;

      case OperatorType.clear:
        return _clear();
    }
  }

  /// button press actions

  void _operation({
    required CalculatorButtonModel model,
    required OperatorType type,
  }) {
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

  void _handleResult(Result result) {
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
      model: CalculatorDisplayModel(
        textModels: [
          CalculatorTextDisplayModel(
            text: res,
            color: result.error != null ? AppColors.red : null,
          ),
        ],
      ),
      displayType: DisplayType.primary,
    );
  }

  /// this method talks to the server via GRPC to get the response
  void _equals() async {
    if (operatorType == null) return;
    _equalsCalled = true;

    if (operatorType == OperatorType.add ||
        operatorType == OperatorType.subtract ||
        operatorType == OperatorType.multiply ||
        operatorType == OperatorType.divide) {
      final result = await _service.operate(
        operandA: double.parse(operandA),
        operandB: double.parse(operandB),
        operatorType: operatorType!,
      );

      _handleResult(result);
    }
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

  void _factorize() {}

  void _average() {}

  void _max() {}

  void _clear() {
    operandA = '';
    operandB = '';
    operatorType = null;

    _writeToDisplay(
      model: CalculatorDisplayModel.empty,
      displayType: DisplayType.primary,
    );

    _writeToDisplay(
      model: CalculatorDisplayModel.empty,
      displayType: DisplayType.secondary,
    );
  }
}
