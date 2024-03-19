import 'package:flutter/material.dart';
import 'package:teste/view/cadastro_page.dart';
import 'package:teste/view/home_page.dart';
import 'package:teste/view/login_page.dart';
import 'package:teste/view/perfil_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu aplicativo",
      initialRoute: '/login',
        routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/perfil': (context) => const PerfilPage(),
        '/cadastro':(context) => CadastroPage()
      },
    );
  }
}
