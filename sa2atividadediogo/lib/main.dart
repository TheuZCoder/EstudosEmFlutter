import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static ThemeData theme = ThemeData.light(); // Tema padrão

  static void setAppTheme(ThemeData newTheme) {
    theme = newTheme;
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade Avaliativa 2",
      theme: MyApp.theme, // Usa o tema definido dinamicamente
      home: LoginPage(),
    );
  }
}
