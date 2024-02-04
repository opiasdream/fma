import 'dart:convert';

class Song {
  String name;
  String songUrl;
  String imageUrl;
  String duration;
  Song({
    required this.name,
    required this.songUrl,
    required this.imageUrl,
    required this.duration,
  });

  /// shortened name
  String get shortName =>
      name.length > 30 ? "${name.substring(0, 27)}..." : name;

  Song copyWith({
    String? name,
    String? songUrl,
    String? imageUrl,
    String? duration,
  }) {
    return Song(
      name: name ?? this.name,
      songUrl: songUrl ?? this.songUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'songUrl': songUrl,
      'imageUrl': imageUrl,
      'duration': duration,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      name: map['name'] ?? '',
      songUrl: map['songUrl'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      duration: map['duration'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Song(name: $name, songUrl: $songUrl, imageUrl: $imageUrl, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song &&
        other.name == name &&
        other.songUrl == songUrl &&
        other.imageUrl == imageUrl &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        songUrl.hashCode ^
        imageUrl.hashCode ^
        duration.hashCode;
  }
}
