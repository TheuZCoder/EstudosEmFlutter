import 'package:flutter/material.dart';
import 'profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: ProfileLayout(),
    );
  }
}
