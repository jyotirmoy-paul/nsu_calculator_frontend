import 'package:calculator_frontend/screens/app/app_controller.dart';
import 'package:calculator_frontend/screens/calculator_screen/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeStateProvider);

    return MaterialApp(
      title: 'Not so useful Calculator',
      theme: theme.data,
      home: const CalculatorPage(),
    );
  }
}
