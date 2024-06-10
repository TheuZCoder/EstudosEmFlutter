import 'package:flutter/material.dart';
import 'package:projeto_firebase/service/AuthService.dart';

class RegistrarScreen extends StatefulWidget {
  const RegistrarScreen({super.key});

  @override
  State<RegistrarScreen> createState() => _RegistrarScreenState();
}

class _RegistrarScreenState extends State<RegistrarScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela de registro com confirmação de senha
      body: Padding(padding: EdgeInsets.all(12),
      child:  Center(child: Form(key: _formKey, child: Column(
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
          TextFormField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(labelText: 'Confirme a senha'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, confirme a senha';
              }
              if (value != passwordController.text) {
                return 'As senhas não coincidem';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                dynamic result = await _auth.registerWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
                if (result != null) {
                  Navigator.pushNamed(context, '/home');
                }
              }
            },
            child: const Text('Registrar'),
          ),
        ],
      ),),),
      ),
    );
  }
}
