import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase/controller/TodoListController.dart';
import 'package:projeto_firebase/service/AuthService.dart';

import '../model/TodolistModel.dart';

class TodolistScreen extends StatefulWidget {
  final User user;
  const TodolistScreen({super.key, required this.user});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  final AuthService _service =AuthService();
  final TodoListController _controller = TodoListController();

  TextEditingController _tarefaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Firebase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              //chamar o logout
              await _service.logoutUsuario();
              Navigator.pushReplacementNamed(context, '/home');
            })]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //campo de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tarefaController,
              decoration: const InputDecoration(
                labelText: 'Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          //botao adicionar
          ElevatedButton(
            onPressed: () {
              if (_tarefaController.text.isNotEmpty) {
                _controller.addTarefa(Todolist(
                  id: '',
                  userId: widget.user.uid,
                  titulo: _tarefaController.text,
                  timestamp: DateTime.now(),
                ));
                _tarefaController.clear();
              } else {
                
                
              }
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}