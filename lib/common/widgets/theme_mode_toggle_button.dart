import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/common/providers/theme_mode_provider.dart';

class ThemeModeToggleButton extends StatelessWidget {
  const ThemeModeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeModeProvider);

      return ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: const Text(darkTheme),
        trailing: Switch.adaptive(
          value: theme == ThemeMode.dark ? true : false,
          onChanged: (isDark) async {
            ThemeMode mode = isDark ? ThemeMode.dark : ThemeMode.light;
            ref.read(themeModeProvider.notifier).state = mode;
            // TODO fix this
            // await HiveUserDataService().setTheme(mode);
          },
        ),
      );
    });
  }
}
