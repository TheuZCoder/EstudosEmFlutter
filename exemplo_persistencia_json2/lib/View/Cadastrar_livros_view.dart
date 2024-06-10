import 'package:flutter/material.dart';

class CadastrarLivrosView extends StatefulWidget {
  const CadastrarLivrosView({super.key});

  @override
  State<CadastrarLivrosView> createState() => _CadastrarLivrosViewState();
}

class _CadastrarLivrosViewState extends State<CadastrarLivrosView> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  final _editoraController = TextEditingController();
  final _sinopseController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _isbnController = TextEditingController();
  final _precoLivroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Livros"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12), 
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(labelText: "Titulo do Livro"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "Titulo não pode ser vazio";
                      } else {
                        return null;
                      }
                    }),
                  TextFormField(
                    controller: _autorController,
                    decoration: const InputDecoration(labelText: "Autor do Livro"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "Autor não pode ser vazio";
                      } else {
                        return null;
                      }
                    }),
                  TextFormField(
                    controller: _editoraController,
                    decoration: const InputDecoration(labelText: "editora do Livro"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "editora não pode ser vazio";
                      } else {
                        return null;
                      }
                    }
                  ),
                  TextFormField(
                    controller: _sinopseController,
                    decoration: const InputDecoration(labelText: "sinopse do Livro"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "sinopse não pode ser vazio";
                      } else {
                        return null;
                      }
                    }
                  ),
                  TextFormField(
                    controller: _categoriaController,
                    decoration: const InputDecoration(labelText: "categoria do Livro separe por ','"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "categoria não pode ser vazio";
                      } else {
                        return null;
                      }
                    }
                  ),
                  TextFormField(
                    controller: _isbnController,
                    decoration: const InputDecoration(labelText: "isbn do Livro separe por"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "isbn não pode ser vazio";
                      } else {
                        return null;
                      }
                    }
                  ),
                  TextFormField(
                    controller: _precoLivroController,
                    decoration: const InputDecoration(labelText: "preço do Livro"),
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "preço não pode ser vazio";
                      } else {
                        return null;
                      }
                    }
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(child: const Text("Cadastrar"),
                  onPressed: () =>{ if(_formKey.currentState!.validate()) {_cadastrarLivro()}},)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _cadastrarLivro {

}