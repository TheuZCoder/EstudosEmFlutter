import 'package:flutter/material.dart';
import 'person.dart';

class PersonTile extends StatelessWidget {
  final Person person;

  PersonTile({required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Endereço: ${person.address}'),
          ),
        );
      },
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Nome: ${person.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cake),
                Text('Idade: ${person.age} anos'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                Text('Endereço: ${person.address}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.phone),
                Text('Telefone: ${person.phone}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.email),
                Text('E-mail: ${person.email}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
