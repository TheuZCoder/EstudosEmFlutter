import 'dart:convert';
import 'package:exemplo_mplayer/Models/musicModel.dart';
import 'package:http/http.dart' as http;

class musicService {
  final Uri uri = Uri.parse('http://192.168.56.1:3000/music');
  

  List<musicModel> _listMusic = [];
  List<musicModel> get listMusic => _listMusic;

  //fetch lista de musicas
  Future<List<musicModel>> fetchMusic() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> list = json.decode(response.body);
      _listMusic = list.map((e) => musicModel.fromJson(e)).toList();
      return _listMusic;
    } else {
      throw Exception('Failed to load music');
    }
  }
}