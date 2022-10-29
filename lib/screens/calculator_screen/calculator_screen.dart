import 'package:calculator_frontend/screens/app/app_controller.dart';
import 'package:calculator_frontend/screens/app/app_theme_data.dart';
import 'package:calculator_frontend/screens/calculator_screen/widgets/calculator_buttons.dart';
import 'package:calculator_frontend/screens/calculator_screen/widgets/calculator_display.dart';
import 'package:calculator_frontend/screens/calculator_screen/widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 0,
        systemOverlayStyle: theme.type == ThemeType.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [
            /// button to change theme of the app
            ThemeButton(),

            /// display area
            CalculatorDisplay(),

            /// buttons
            CalculatorButtons(),
          ],
        ),
      ),
    );
  }
}
