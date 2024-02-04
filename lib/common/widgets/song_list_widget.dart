import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/components/song_card.dart';
import 'package:fma/common/widgets/loader.dart';
import 'package:fma/screens/home/providers/song_list_source_provider.dart';
import 'package:fma/screens/home/repositories/song_repository.dart';

class SongListWidget extends ConsumerWidget {
  const SongListWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return FutureBuilder(
      future: SongRepository().getSongList(ref.watch(songListSourceProvider)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("There were no results."),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SongCard(source: snapshot.data![index]);
                  }),
            );
          }
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else {
          return const Loader();
        }
      },
    );
  }
}
