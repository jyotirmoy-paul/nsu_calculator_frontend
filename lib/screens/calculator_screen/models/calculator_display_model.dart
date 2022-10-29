import 'calculator_text_display_model.dart';

enum DisplayOperationType {
  average,
  factorisation,
  maximum,
  none,
}

class CalculatorDisplayModel {
  final DisplayOperationType operationType;
  final List<CalculatorTextDisplayModel> textModels;

  const CalculatorDisplayModel({
    this.operationType = DisplayOperationType.none,
    this.textModels = const [],
  });

  static const empty = CalculatorDisplayModel();
}
