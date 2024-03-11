import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Senha'),
          obscureText: true,
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            // Adicione aqui a lógica para submeter o formulário
            print('Nome: ${_nameController.text}');
            print('E-mail: ${_emailController.text}');
            print('Senha: ${_passwordController.text}');
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
  }
}
