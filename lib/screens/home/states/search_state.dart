import 'package:flutter/material.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/widgets/song_list_widget.dart';
import 'package:fma/screens/home/widgets/search_bar_widget.dart';

class SearchState extends StatelessWidget {
  const SearchState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          children: [SearchBarWidget(), SongListWidget()],
        ),
      )),
    );
  }
}
