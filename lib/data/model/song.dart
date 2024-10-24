/*
"id": "1075170083",
      "title": "Tìm Em",
      "album": "Con Nợ Mẹ",
      "artist": "Trịnh Đình Quang",
      "source": "https://thantrieu.com/resources/music/1075170083.mp3",
      "image": "https://thantrieu.com/resources/arts/1075170082.webp",
      "duration": 222,
      "favorite": "false",
      "counter": 0,
      "replay": 0
 */

class Song {
  String id;

  Song(
      {required this.id,
      required this.title,
      required this.album,
      required this.artist,
      required this.source,
      required this.image,
      required this.duration});

  factory Song.fromJson(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      album: map['album'],
      artist: map['artist'],
      source: map['source'],
      image: map['image'],
      duration: map['duration'],
    );
  }

  String title;
  String album;
  String artist;
  String source;

  @override
  String toString() {
    return 'Song{id: $id, title: $title, album: $album, artist: $artist, source: $source, image: $image, duration: $duration}';
  }

  String image;
  int duration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Song && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
