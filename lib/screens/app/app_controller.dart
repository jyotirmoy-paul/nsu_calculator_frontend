import 'dart:math';

import 'app_theme_data.dart';
import '../../themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appControllerProvider = Provider((ref) => AppController(ref));
final appThemeStateProvider = StateProvider<AppThemeData>((ref) {
  /// let dark theme bet the
  return Themes.darkThemeData;
});

class AppController {
  final Ref _ref;
  AppController(this._ref);

  void onLightThemeButtonPressed() {
    _ref.read(appThemeStateProvider.notifier).state = Themes.lightThemeData;
  }

  void onDarkThemeButtonPressed() {
    _ref.read(appThemeStateProvider.notifier).state = Themes.darkThemeData;
  }
}
