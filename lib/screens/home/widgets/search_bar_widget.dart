import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/screens/home/providers/song_list_source_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      autocorrect: true,
      inputFormatters: [LengthLimitingTextInputFormatter(350)],
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value) {
        if (value.length > 2) {
          ref.read(songListSourceProvider.notifier).state = value;
        }
      },
      decoration: const InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none),
    );
  }
}
