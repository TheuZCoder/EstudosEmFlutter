class musicModel {
  String title;
  String artist;
  String album;
  String url;

  musicModel({
    required this.title,
    required this.artist,
    required this.album,
    required this.url,
  });

  factory musicModel.fromJson(Map<String, dynamic> json) {
    return musicModel(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      url: json['url'],
    );
  }
}