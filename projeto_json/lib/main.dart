import 'package:flutter/material.dart';
import 'package:projeto_json/View/CadastroView.dart';
import 'package:projeto_json/View/HomePage.dart';
import 'package:projeto_json/View/ListaLivrosView.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livraria Senai",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/cadastro': (context) => const CadastrarLivrosView(),
        '/listar':(context) => const ListarLivrosPage(),
      },
    );
  }
}