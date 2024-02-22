import 'package:app_to_do_list/TarefaController.dart';
import 'package:app_to_do_list/TarefaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaTarefaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Definindo a tela inicial como a listaTarefas
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}
