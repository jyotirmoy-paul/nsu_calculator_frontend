import 'display_text_model.dart';

enum DisplayOperationType {
  average,
  factorization,
  sum,
  none,
}

class DisplayModel {
  final DisplayOperationType operationType;
  final List<DisplayTextModel> textModels;

  const DisplayModel({
    this.operationType = DisplayOperationType.none,
    this.textModels = const [],
  });

  static const empty = DisplayModel();
}
