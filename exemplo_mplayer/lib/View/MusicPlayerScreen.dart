import 'package:exemplo_mplayer/Models/musicModel.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerScreen extends StatefulWidget {
  final musicModel music;
  const MusicPlayerScreen({super.key, required this.music});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _playMusic() async {
    try {
      await _audioPlayer.play(UrlSource(widget.music.url));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print("Error playing music: $e");
    }
  } 

  void _pauseMusic() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Error pausing music: $e");
    }
  }

  void _stopMusic() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Error stopping music: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.music.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.music.artist,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 64),
              onPressed: isPlaying ? _pauseMusic : _playMusic,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _stopMusic,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
