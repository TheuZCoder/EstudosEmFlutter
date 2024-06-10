import 'package:exemplo_mplayer/Services/musicService.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final musicService _service = musicService();
  Future<void> musicList() async {
   try {
     await _service.fetchMusic();
   } catch (e) {
     print(e.toString());
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: //future builder,
      Padding(padding: const EdgeInsets.all(8),
        child: Center(child: FutureBuilder(
          future: musicList(), 
          builder: (context, snapshot){
            if (_service.listMusic.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: _service.listMusic.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(_service.listMusic[index].title),
                    subtitle: Text(_service.listMusic[index].artist),
                    onTap: () {
                      //play music
                    },
                  );
                },
              );
              
            }
          }),
        ),
      )
    );
  }
}