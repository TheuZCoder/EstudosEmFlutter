import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sa3atividadediogo/Model/tarefaModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class TarefaController extends ChangeNotifier {
  static final TarefaController instance = TarefaController._privateConstructor();
  static Database? _databaseTarefa;

  TarefaController._privateConstructor();

  
  Future<Database> get database async {
    if (_databaseTarefa != null) return _databaseTarefa!;
    _databaseTarefa = await _initDatabase();
    return _databaseTarefa!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_databaseTarefa.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
  await db.execute('''
    CREATE TABLE tarefas(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      descricao TEXT NOT NULL,
      userId INTEGER NOT NULL
    )
  ''');
}

  Future<int> insertTarefa(Tarefa tarefa, int userId) async {
  Database db = await instance.database;
  Map<String, dynamic> taskMap = tarefa.toMap();
  taskMap['userId'] = userId;
  return await db.insert('tarefas', taskMap);
}

  Future<List<Tarefa>> getTarefas() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('tarefas');
    return List.generate(maps.length, (i) {
      return Tarefa(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        descricao: maps[i]['descricao'],
      );
    });
  }

  Future<List<Tarefa>> loadTarefas(int userId) async {
  Database db = await instance.database;
  List<Map<String, dynamic>> tarefas = await db.query('tarefas', where: 'userId = ?', whereArgs: [userId]);
  List<Tarefa> tarefa = tarefas.map((task) => Tarefa.fromMap(task)).toList();
  return tarefa;
}

  
}
