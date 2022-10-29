import '../../calculator_controller.dart';
import 'calculator_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends ConsumerWidget {
  final CalculatorButtonModel model;

  const CalculatorButton(this.model, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(calculatorControllerProvider).onButtonPress(model);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            model.label,
            style: GoogleFonts.poppins(
              color: model.labelColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
