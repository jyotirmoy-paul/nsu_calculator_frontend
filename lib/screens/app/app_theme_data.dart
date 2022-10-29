import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppThemeData {
  final ThemeData data;
  final ThemeType type;

  AppThemeData({
    required this.data,
    required this.type,
  });
}
