import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/CadastroLivrosController.dart';

class ListarLivrosPage extends StatefulWidget {
  const ListarLivrosPage({Key? key}) : super(key: key);

  @override
  State<ListarLivrosPage> createState() => _ListarLivrosPageState();
}

class _ListarLivrosPageState extends State<ListarLivrosPage> {
  LivrosController _controller = LivrosController();

  @override
  void initState() {
    super.initState();
    _controller.getLivros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Livros"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: _controller.livros.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_controller.livros[index].titulo),
              subtitle: Text(_controller.livros[index].autor),
              leading: Image.file(File(_controller.livros[index].capa)),
              onTap: () {
                //Navigator.pushNamed(context, '/detalhes');
              },
            );
          },
        ),
      ),
    );
  }
}