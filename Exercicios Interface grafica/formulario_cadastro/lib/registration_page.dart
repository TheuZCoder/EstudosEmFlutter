import 'package:flutter/material.dart';
import 'registration_form.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}
