import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Configurações do Usuário'),
            SizedBox(height: 20),
            // Adicione aqui opções de configurações, como tema, idioma, etc.
          ],
        ),
      ),
    );
  }
}
