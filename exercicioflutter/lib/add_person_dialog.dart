import 'package:flutter/material.dart';

import 'person.dart';

class AddPersonDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Pessoa'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            String name = nameController.text;
            int age = int.tryParse(ageController.text) ?? 0;
            String address = addressController.text;
            String email = emailController.text;
            String phone = phoneController.text;

            if (name.isNotEmpty && age > 0) {
              Navigator.pop(
                context,
                Person(
                  name: name,
                  age: age,
                  address: address,
                  email: email,
                  phone: phone,
                ),
              );
            } else {
              // Tratamento de erro, por exemplo, exibir uma mensagem ao usuário.
            }
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
