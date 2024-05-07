import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_json/Controller/CadastroLivrosController.dart';
import 'package:projeto_json/Model/LivrosModel.dart';

class CadastrarLivrosView extends StatefulWidget {
  const CadastrarLivrosView({super.key});

  @override
  State<CadastrarLivrosView> createState() => _CadastrarLivrosViewState();
}

class _CadastrarLivrosViewState extends State<CadastrarLivrosView> {
  LivrosController controller = LivrosController();
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  final _editoraController = TextEditingController();
  final _sinopseController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _isbnController = TextEditingController();
  final _precoLivroController = TextEditingController();
  final _controller = LivrosController();

  File? _imageSelecionada;

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
                      decoration:
                          const InputDecoration(labelText: "Titulo do Livro"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Titulo não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _autorController,
                      decoration:
                          const InputDecoration(labelText: "Autor do Livro"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Autor não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _editoraController,
                      decoration:
                          const InputDecoration(labelText: "editora do Livro"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "editora não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _sinopseController,
                      decoration:
                          const InputDecoration(labelText: "sinopse do Livro"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "sinopse não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _categoriaController,
                      decoration: const InputDecoration(
                          labelText: "categoria do Livro separe por ','"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "categoria não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _isbnController,
                      decoration: const InputDecoration(
                          labelText: "isbn do Livro separe por"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "isbn não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      controller: _precoLivroController,
                      decoration:
                          const InputDecoration(labelText: "preço do Livro"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "preço não pode ser vazio";
                        } else {
                          return null;
                        }
                      }),
                  _imageSelecionada != null
                      ? Image.file(
                          _imageSelecionada!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: () => _tirarFotoCapa(),
                    child: const Text("Tirar foto"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text("Cadastrar"),
                    onPressed: () => {
                      if (_formKey.currentState!.validate()) {_cadastrarLivro()}
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _tirarFotoCapa() async {
    final image = ImagePicker();
    final pickedfile = await image.pickImage(source: ImageSource.camera);
    if (pickedfile != null) {
      setState(() {
        _imageSelecionada = File(pickedfile.path);
      });
    }
  }

  Future<void> _cadastrarLivro() async {
    final livros = Livros(
        id: controller.livros.length + 1,
        titulo: _tituloController.text,
        autor: _autorController.text,
        editora: _editoraController.text,
        sinopse: _sinopseController.text,
        categoria: _categoriaController.text.split(","),
        isbn: _isbnController.text,
        preco: double.parse(_precoLivroController.text),
        capa: _imageSelecionada!.path);
    controller.addLivro(livros);
    _controller.saveJson();
    _cleanCampos();
    //SNACKBAR
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Livro cadastrado com sucesso"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _cleanCampos() {
    _tituloController.clear();
    _autorController.clear();
    _editoraController.clear();
    _sinopseController.clear();
    _categoriaController.clear();
    _isbnController.clear();
    _precoLivroController.clear();
    _imageSelecionada = null;
    setState(() {});
  }
}
