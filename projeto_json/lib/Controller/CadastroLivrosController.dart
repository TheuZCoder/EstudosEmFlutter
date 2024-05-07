import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projeto_json/Model/LivrosModel.dart';

class LivrosController {
  List<Livros> livros = [];

  Future<List<Livros>> getLivros() {
    return Future.value(livros);
  }

  void addLivro(Livros livro) {
    livros.add(livro);
  }
  
  //json - salvar/carregar

  Future<void> saveJson() async {
    //salvar
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    File jsonFile = File('$path/livros.json');
    String json = jsonEncode(livros);
    await jsonFile.writeAsString(json);
  }
}