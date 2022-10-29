import 'package:calculator_frontend/screens/app/app_theme_data.dart';
import 'package:flutter/material.dart';

class Themes {
  const Themes._();

  static AppThemeData get lightThemeData => AppThemeData(
        data: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xffffffff),
          backgroundColor: const Color(0xfffaf9f9),
          cardColor: const Color(0xfff8f7f7),
        ),
        type: ThemeType.light,
      );

  static AppThemeData get darkThemeData => AppThemeData(
        data: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff23252c),
          backgroundColor: const Color(0xff2a2d35),
          cardColor: const Color(0xff282b32),
        ),
        type: ThemeType.dark,
      );
}
