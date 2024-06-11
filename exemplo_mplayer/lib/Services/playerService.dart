  import 'package:audioplayers/audioplayers.dart';

  class PlayerMusicService {
    final AudioPlayer _audioPlayer = AudioPlayer();
    AudioPlayer get audioPlayer => _audioPlayer;

    Future<void> playMusic(String url) async {
      try {
        _audioPlayer.play(UrlSource(url));
      } catch (e) {
        print("Error playing music: $e");
      }
    }
  }