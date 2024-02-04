import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/screens/home/extension/pages_extension.dart';
import 'package:fma/screens/home/providers/pages_controller.dart';
import 'package:fma/screens/home/widgets/mini_player_widget.dart';
import 'package:fma/screens/settings/settings_screen.dart';
import 'package:iconsax/iconsax.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName), actions: [goSettingsScreen()]),
      body: Pages.values[ref.watch(pagesController)].state(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget goSettingsScreen() => IconButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
      icon: const Icon(Iconsax.setting4));

  Widget bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 80, width: double.infinity, child: MiniPlayer()),
        BottomNavigationBar(
            items: List.generate(Pages.values.length,
                (index) => Pages.values[index].toBottomNavigationBarItem()),
            currentIndex: ref.watch(pagesController),
            onTap: (index) => ref.read(pagesController.notifier).state = index),
      ],
    );
  }
}
