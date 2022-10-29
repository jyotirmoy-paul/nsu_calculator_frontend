import 'dart:ui';

import '../../../../themes/app_colors.dart';

enum OperatorType {
  add,
  subtract,
  divide,
  multiply,
  equals,
  dot,
  number,
  factorize,
  average,
  max,
  clear,
}

class CalculatorButtonModel {
  final String label;
  final Color? labelColor;
  final OperatorType operatorType;

  const CalculatorButtonModel({
    required this.label,
    required this.operatorType,
    this.labelColor,
  });
}

class CalculatorButtonModelList {
  const CalculatorButtonModelList._();

  /// first row -> AC, AVG, FAC, Divide
  static const List<CalculatorButtonModel> _row1 = [
    CalculatorButtonModel(
      label: 'AC',
      labelColor: AppColors.green,
      operatorType: OperatorType.clear,
    ),
    CalculatorButtonModel(
      label: 'avg',
      labelColor: AppColors.green,
      operatorType: OperatorType.average,
    ),
    CalculatorButtonModel(
      label: 'fac',
      labelColor: AppColors.green,
      operatorType: OperatorType.factorize,
    ),
    CalculatorButtonModel(
      label: '÷',
      labelColor: AppColors.red,
      operatorType: OperatorType.divide,
    ),
  ];

  /// second row -> 7, 8, 9, Multiply
  static const List<CalculatorButtonModel> _row2 = [
    CalculatorButtonModel(
      label: '7',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '8',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '9',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '×',
      labelColor: AppColors.red,
      operatorType: OperatorType.multiply,
    ),
  ];

  /// first row -> 4, 5, 6, Subtract
  static const List<CalculatorButtonModel> _row3 = [
    CalculatorButtonModel(
      label: '4',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '5',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '6',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '−',
      labelColor: AppColors.red,
      operatorType: OperatorType.subtract,
    ),
  ];

  /// first row -> 1, 2, 3, Add
  static const List<CalculatorButtonModel> _row4 = [
    CalculatorButtonModel(
      label: '1',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '2',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '3',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '+',
      labelColor: AppColors.red,
      operatorType: OperatorType.add,
    ),
  ];

  /// first row -> Max, 0, ., =
  static const List<CalculatorButtonModel> _row5 = [
    CalculatorButtonModel(
      label: 'max',
      operatorType: OperatorType.max,
    ),
    CalculatorButtonModel(
      label: '0',
      operatorType: OperatorType.number,
    ),
    CalculatorButtonModel(
      label: '.',
      operatorType: OperatorType.dot,
    ),
    CalculatorButtonModel(
      label: '=',
      labelColor: AppColors.red,
      operatorType: OperatorType.equals,
    ),
  ];

  /// combining all the buttons
  static const List<CalculatorButtonModel> buttons = [
    ..._row1,
    ..._row2,
    ..._row3,
    ..._row4,
    ..._row5,
  ];
}
