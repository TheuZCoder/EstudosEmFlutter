import "package:flutter/material.dart";

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Text('Esta é a página do perfil do usuário.'),
      ),
    );
  }
}