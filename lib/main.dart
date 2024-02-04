import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/config/app_theme_data.dart';
import 'package:fma/common/providers/theme_mode_provider.dart';
import 'package:fma/screens/home/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ThemeMode themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: appName,
      themeMode: themeMode,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      home: const RootScreen(),
    );
  }
}
