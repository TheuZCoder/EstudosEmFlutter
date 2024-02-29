// item_widget.dart
import 'package:flutter/material.dart';
import 'package:lista_mercado/models/item.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  ItemWidget({required this.item, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.nome),
      leading: Checkbox(
        value: item.concluido,
        onChanged: (value) {
          onUpdate();
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
