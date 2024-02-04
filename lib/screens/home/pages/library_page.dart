import 'package:flutter/material.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/screens/home/pages/home_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      children: [
        const SubtitleWidget(subtitle: yourPlaylists),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (i) => Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.only(right: defaultPadding),
                child: const Placeholder(),
              ),
            ),
          ),
        ),
        const SubtitleWidget(subtitle: yourSongs),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: List.generate(
              50,
              (i) => const SizedBox(height: 50, child: Placeholder()),
            ),
          ),
        ),
      ],
    );
  }
}
