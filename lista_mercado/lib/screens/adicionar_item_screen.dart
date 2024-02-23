// adicionar_item_screen.dart
import 'package:flutter/material.dart';
import 'package:lista_mercado/models/item.dart';

class AdicionarItemScreen extends StatelessWidget {
  final Function(Item) onAdd;

  AdicionarItemScreen({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    String novoItem = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                novoItem = value;
              },
              decoration: InputDecoration(labelText: 'Nome do Item'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (novoItem.trim().isNotEmpty) {
                  onAdd(Item(novoItem, false));
                  Navigator.pop(context); // Voltar para a tela anterior
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}