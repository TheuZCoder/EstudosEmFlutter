import 'package:flutter/material.dart';
import 'package:teste/view/cadastro_page.dart';
import 'package:teste/view/home_page.dart';
import 'package:teste/view/login_page.dart';
import 'package:teste/view/perfil_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu aplicativo",
      initialRoute: '/login',
        routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/perfil': (context) => PerfilPage(),
        '/cadastro':(context) => CadastroPage()
      },
    );
  }
}
