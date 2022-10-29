import 'package:calculator_frontend/screens/app/app_controller.dart';
import 'package:calculator_frontend/screens/app/app_theme_data.dart';
import 'package:calculator_frontend/screens/calculator_screen/calculator_controller.dart';
import 'package:calculator_frontend/screens/calculator_screen/models/calculator_display_model.dart';
import 'package:calculator_frontend/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/calculator_text_display_model.dart';

class CalculatorDisplay extends ConsumerWidget {
  const CalculatorDisplay({super.key});

  RichText _buildRichText(
    List<CalculatorTextDisplayModel> textModels, {
    Color? defaultColor,
    double fontSize = 32.0,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        style: TextStyle(
          color: defaultColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        children: textModels
            .map<TextSpan>(
              (model) => TextSpan(
                text: model.text,
                style: GoogleFonts.poppins(
                  color: model.color,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// secondary display
            Consumer(
              key: const ValueKey('Secondary Display'),
              builder: (_, WidgetRef ref, __) {
                final state = ref.watch(secondaryDisplayStateProvider);
                final theme = ref.watch(appThemeStateProvider);

                return _buildRichText(
                  state.textModels,
                  defaultColor: theme.type == ThemeType.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                );
              },
            ),

            /// primary display
            Consumer(
              key: const ValueKey('Primary Display'),
              builder: (_, WidgetRef ref, __) {
                final state = ref.watch(primaryDisplayStateProvider);
                final theme = ref.watch(appThemeStateProvider);

                return Row(
                  children: [
                    /// label, if any operation is ongoing
                    if (state.operationType != DisplayOperationType.none)
                      Text(
                        state.operationType.name,
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: AppColors.green,
                        ),
                      ),

                    /// main content
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: _buildRichText(
                          state.textModels,
                          defaultColor: theme.type == ThemeType.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
