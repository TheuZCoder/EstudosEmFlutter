import 'package:flutter/material.dart';
import 'package:projeto_apirest/models/Produto.dart';
import 'package:projeto_apirest/screens/HomeScreen.dart';

import 'controllers/ProdutoController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto API REST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}