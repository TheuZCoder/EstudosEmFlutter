import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sa2atividadediogo/login.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart'; // Importe os modelos User e Email

class DatabaseHelper extends ChangeNotifier {
  String? currentUserEmail;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
  }

  Future<bool> login(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (users.isNotEmpty) {
      currentUserEmail = email;
      saveUserId(users[0]['id']); // Salva o ID do usuário ao fazer login
      return true;
    }
    return false;
  }

  Future<List<Email>> loadEmails() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query('users');
    List<Email> emails = users.map((user) => Email.fromMap(user)).toList();
    return emails;
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  Future<void> logout(BuildContext context) async {
    // Limpar dados de sessão local (por exemplo, nome de usuário)
    currentUserEmail = null;

    // Redirecionar para a tela de login
    redirectToLoginPage(context);
  }

  void redirectToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
