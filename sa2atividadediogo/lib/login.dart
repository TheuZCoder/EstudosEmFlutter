import 'package:flutter/material.dart';
import 'package:sa2atividadediogo/DataBaseHelper.dart';
import 'config.dart';

class LoginPage extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                final isAuthenticated =
                    await _databaseHelper.login(email, password);
                if (isAuthenticated) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsPage()), 
                  );
                } else {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('E-mail ou senha incorretos')),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
