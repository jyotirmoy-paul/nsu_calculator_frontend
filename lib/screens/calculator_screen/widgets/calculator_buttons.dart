import 'calculator_button/calculator_button.dart';
import 'calculator_button/calculator_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorButtons extends ConsumerWidget {
  const CalculatorButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(38.0),
        ),
      ),
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 36.0,
          vertical: 48.0,
        ),
        crossAxisCount: 4,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 12.0,
        children: CalculatorButtonModelList.buttons
            .map<Widget>((model) => CalculatorButton(model))
            .toList(),
      ),
    );
  }
}
