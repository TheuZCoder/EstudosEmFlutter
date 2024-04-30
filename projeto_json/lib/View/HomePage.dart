import 'package:flutter/material.dart';
import 'package:projeto_json/View/CadastroView.dart';
import 'package:projeto_json/View/ListaLivrosView.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Livraria Senai')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: Text('Cadastrar Livro'),
              ),
              ElevatedButton(
                onPressed: () {
                 Navigator.pushNamed(context, '/listar');
                },
                child: Text('Listar Livro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
