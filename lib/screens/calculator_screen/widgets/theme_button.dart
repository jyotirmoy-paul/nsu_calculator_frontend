import '../../app/app_controller.dart';
import '../../app/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeStateProvider);
    final isDarkTheme = theme.type == ThemeType.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// light theme button
          InkWell(
            onTap: ref.read(appControllerProvider).onLightThemeButtonPressed,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isDarkTheme ? 0.20 : 1.0,
                child: const Icon(
                  Icons.light_mode_outlined,
                  size: 24.0,
                ),
              ),
            ),
          ),

          // seperator
          const SizedBox(width: 4.0),

          // dark theme button
          InkWell(
            onTap: ref.read(appControllerProvider).onDarkThemeButtonPressed,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: !isDarkTheme ? 0.20 : 1.0,
                child: const Icon(
                  Icons.dark_mode_outlined,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
