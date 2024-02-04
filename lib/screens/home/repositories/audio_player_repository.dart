import 'package:flutter/material.dart';
import 'package:fma/common/constants/texts.dart';
import 'package:fma/common/models/song.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:op_package/song_service.dart';

class AudioPlayerRepository extends ChangeNotifier {
  final _audioPlayer = AudioPlayer();

  AudioPlayer get player => _audioPlayer;

  Song? _currentSong;

  Song? get getCurrentSong => _currentSong;

  bool get isPlaying => _audioPlayer.playing;

  AudioPlayerRepository() {
    _init();
  }

  void _init() async {
    await changeSong(_currentSong);

    player.createPositionStream(
        minPeriod: const Duration(seconds: 1),
        maxPeriod: const Duration(seconds: 1));
  }

  Future<void> changeSong(Song? newSong) async {
    if (newSong != null) {
      try {
        String? streamUrl =
            await SongService().songStreamUrlParser(newSong.songUrl);

        if (streamUrl == null) return;

        await _audioPlayer.pause();

        var source = AudioSource.uri(
          Uri.parse(streamUrl.toString()),
          tag: MediaItem(
            id: "3521544",
            title: newSong.name,
            artUri: Uri.parse(newSong.imageUrl),
            displayTitle: newSong.name,
            displaySubtitle: newSong.name,
          ),
        );

        _currentSong = newSong;

        await _audioPlayer.setAudioSource(source);

        await seek(Duration.zero);

        _audioPlayer.play();

        notifyListeners();
      } catch (e) {
        Null;
      }
    }
  }

  void play() async {
    _audioPlayer.play();
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Song get emtySong =>
      Song(name: songIsNotFound, imageUrl: "", songUrl: "", duration: "");
}
