// RegisterPage
import 'package:flutter/material.dart';
import 'package:sa3atividadediogo/controller/DataBaseHelper.dart';
import 'package:sa3atividadediogo/model/emailmodel.dart';
import 'package:sa3atividadediogo/model/usermodel.dart';
import 'package:sa3atividadediogo/view/login.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                String confirmPassword = _confirmPasswordController.text.trim();  
                if (email == '' || password == '' || confirmPassword == '') {
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Os campos precisam estar preenchidos para se cadastrar')),
                   );
                }else{
                if (password == confirmPassword) {
                  await DatabaseHelper.instance.insertUser(
                    User(email: email, password: password),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Usuário registrado com sucesso')),
                  );           
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('As senhas não coincidem')),
                  );
                }
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
