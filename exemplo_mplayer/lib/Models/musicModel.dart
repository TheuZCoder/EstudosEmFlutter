class musicModel {
  String title;
  String artist;
  String url;

  musicModel({
    required this.title,
    required this.artist,
    required this.url,
  });

  factory musicModel.fromJson(Map<String, dynamic> json) {
    return musicModel(
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}