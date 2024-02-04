import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fma/screens/home/repositories/audio_player_repository.dart';

final audioPlayerRepositoryProvider =
    ChangeNotifierProvider<AudioPlayerRepository>(
        (ref) => AudioPlayerRepository());

final durationStreamProvider = StreamProvider.autoDispose<Duration?>((ref) {
  return ref.read(audioPlayerRepositoryProvider).player.durationStream;
});

final positionStreamProvider = StreamProvider.autoDispose<Duration?>((ref) {
  return ref.read(audioPlayerRepositoryProvider).player.positionStream;
});

final bufferedStreamProvider = StreamProvider.autoDispose<Duration?>((ref) {
  return ref.read(audioPlayerRepositoryProvider).player.bufferedPositionStream;
});
