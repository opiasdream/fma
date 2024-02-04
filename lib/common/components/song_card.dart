import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/models/song.dart';
import 'package:fma/common/widgets/loader.dart';
import 'package:fma/screens/home/providers/music_providers.dart';

class SongCard extends ConsumerWidget {
  const SongCard({super.key, required this.source});

  final Song source;

  @override
  Widget build(BuildContext context, ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: smallPadding),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        onTap: () async {
          ref.read(audioPlayerRepositoryProvider).changeSong(source);
        },
        leading: AspectRatio(
            aspectRatio: 168 / 126,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: source.imageUrl,
                progressIndicatorBuilder: (_, __, ___) => const Loader(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )),
        title: Text(source.shortName),
        subtitle: Text(source.duration),
        // trailing: const Icon(Icons.play_arrow),
      ),
    );
  }
}
