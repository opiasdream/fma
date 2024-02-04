import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/common/constants/dimens.dart';
import 'package:fma/common/constants/text_styles.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/common/models/song.dart';
import 'package:fma/screens/home/providers/music_providers.dart';
import 'package:fma/screens/home/repositories/audio_player_repository.dart';
import 'package:iconsax/iconsax.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  /// formatter function from [duration] to "mm:ss".
  String durationToString(Duration? duration) {
    if (duration != null) {
      return "${(duration.inSeconds / 60).toString().split(".").first}:${(duration.inSeconds % 60).truncate().toString().padLeft(2, '0')}";
    } else {
      return "0:00";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var player = ref.watch(audioPlayerRepositoryProvider);

      Song currentSong = player.getCurrentSong ?? player.emtySong;

      var duration = ref.watch(durationStreamProvider);

      Duration? position =
          ref.watch(positionStreamProvider).value ?? Duration.zero;

      Duration? buffered =
          ref.watch(bufferedStreamProvider).value ?? Duration.zero;

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(currentSong.shortName),
                    playerControllerWidget(
                        player, duration, position, buffered),
                  ],
                ),
              ),
              albumCoverWidget(currentSong.imageUrl)
            ],
          ),
        ],
      );
    });
  }

  Widget playerControllerWidget(AudioPlayerRepository player,
      AsyncValue<Duration?> duration, Duration position, Duration buffered) {
    return Row(
      children: [
        // * Play - Pause Button
        playPauseButton(player),
        // * Position Slider
        Expanded(
          child: duration.when(
              data: (durationData) {
                durationData ??= const Duration(seconds: 1);
                return Row(
                  children: <Widget>[
                    Text(durationToString(position), style: defaultTextStyle),
                    sliderWidget(position, durationData, buffered, player),
                    Text(durationToString(durationData),
                        style: defaultTextStyle),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(value: 1),
              error: (_, __) => const SizedBox.shrink()),
        )
      ],
    );
  }

  Widget playPauseButton(AudioPlayerRepository player) {
    return IconButton(
      icon: Icon(
        player.isPlaying ? Iconsax.pause : Iconsax.play,
        size: 24,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: player.getCurrentSong == null
          ? null
          : () => player.isPlaying ? player.pause() : player.play(),
    );
  }

  Expanded sliderWidget(Duration position, Duration duration, Duration buffered,
      AudioPlayerRepository player) {
    return Expanded(
      child: SliderTheme(
        data: Theme.of(context).sliderTheme.copyWith(
              trackHeight: 2,
              activeTrackColor: const Color(0xff035e4f),
              secondaryActiveTrackColor: Colors.teal,
              inactiveTrackColor: const Color(0xffDCDBDC),
              thumbColor: const Color(0xff035e4f),
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 5, disabledThumbRadius: 8),
              overlayShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 7, disabledThumbRadius: 8),
            ),
        child: Slider(
          value: position.inSeconds / duration.inSeconds,
          secondaryTrackValue: buffered.inSeconds / duration.inSeconds,
          onChanged: (newSliderValue) async {
            player.pause();
            await player.seek(Duration(
                seconds: (newSliderValue * duration.inSeconds).toInt()));
          },
          onChangeEnd: (value) => player.play(),
        ),
      ),
    );
  }

  Widget albumCoverWidget(String albumCover) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: smallPadding),
      child: SizedBox(
        height: 72,
        width: 72,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultPadding),
            child: Image.network(
              albumCover,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Tooltip(
                message: imageNotFound,
                child: Icon(Iconsax.image4),
              ),
            )),
      ),
    );
  }
}
