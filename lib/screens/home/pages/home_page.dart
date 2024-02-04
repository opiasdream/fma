import 'package:flutter/material.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/constants/texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        children: [
          const SubtitleWidget(subtitle: recentlyPlayed),
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
                      )),
            ),
          ),
          const SubtitleWidget(subtitle: fromYourLibrary),
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
                      )),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Divider()),
          Column(
            children: List.generate(
              5,
              (i) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    2,
                    (i) => Container(
                          height: 40,
                          width: 200,
                          padding: const EdgeInsets.all(smallPadding),
                          child: const Placeholder(),
                        )),
              ),
            ),
          ),
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
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Text(subtitle),
          const Expanded(
              child: Divider(indent: defaultPadding, endIndent: defaultPadding))
        ],
      ),
    );
  }
}
