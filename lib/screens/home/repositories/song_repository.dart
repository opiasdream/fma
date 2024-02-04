import 'package:fma/common/models/song.dart';
import 'package:op_package/song_service.dart';

class SongRepository {
  final _songService = SongService();

  /// Returns a list of songs.
  /// song data format: {"name" : "", "songUrl" : "", "imageUrl" : "", "duration" : ""}
  /// If [songName] is null, fetch the songs from home-page.
  /// Else it returns the searched song result from search-page.
  Future<List<Song>> getSongList(String? songName) async {
    return (await _songService.songParserToDisplay(songName) ?? [])
        .map((e) => Song.fromMap(e))
        .toList();
  }

  /// Parses and returns song stream url from [songUrl].
  Future<String?> getSongStreamUrl(String songUrl) async {
    return await _songService.songStreamUrlParser(songUrl);
  }
}
