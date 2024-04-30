import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
 final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Livros'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do produto'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _photoController,
              decoration: InputDecoration(labelText: 'URL da Foto'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _categoriesController,
              decoration: InputDecoration(labelText: 'Categorias (separadas por vírgula)'),
            ),
            SizedBox(height: 24.0),
            //
          ],
        ),
      ),
    );
  }
}