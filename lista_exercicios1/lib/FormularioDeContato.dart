import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContactForm(),
    );
  }
}

class MyContactForm extends StatefulWidget {
  @override
  _MyContactFormState createState() => _MyContactFormState();
}

class _MyContactFormState extends State<MyContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Mensagem'),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar o formulário
                String name = _nameController.text;
                String email = _emailController.text;
                String message = _messageController.text;

                // Aqui você pode adicionar a lógica para enviar os dados do formulário
                print('Nome: $name\nE-mail: $email\nMensagem: $message');
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
