import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_firebase/service/AuthService.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthService _auth = AuthService();


    return Scaffold(
        //criar a tela de login para logar com base no email e senha do firebase
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
