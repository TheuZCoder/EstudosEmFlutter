import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_firebase/service/AuthService.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _service = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //formulario de registro
      body:Padding(padding: EdgeInsets.all(8),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',),
                validator: (value) {},),
                TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',),
                validator: (value) {},),
                TextFormField(
                controller: _confirmedPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',),
                validator: (value) {},),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){ _registrarUser();},
                  child: Text('Registrar'),
                )]
          )),
      ),)
    );
  }
  
  Future<User?> _registrarUser() async {
    if(_formKey.currentState!.validate()){
      if(_passwordController.text==_confirmedPasswordController.text){
        return await _service.registerUsuario(
          _emailController.text, 
          _confirmedPasswordController.text);
          //navegação para págian interna
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('As senhas não conferem!'),
          ),
        );
        _passwordController.clear();
        _confirmedPasswordController.clear();
        return null;
      }
    }
  }
}