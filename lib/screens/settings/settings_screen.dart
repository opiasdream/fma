import 'package:flutter/material.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/common/widgets/theme_mode_toggle_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(settings),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        children: const [
          ThemeModeToggleButton(),
        ],
      ),
    );
  }
}
