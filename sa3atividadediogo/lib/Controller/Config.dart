import 'package:flutter/material.dart';
import 'package:sa3atividadediogo/Controller/TarefaController.dart';
import 'package:sa3atividadediogo/Model/tarefaModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sa3atividadediogo/controller/DataBaseHelper.dart';
import 'package:sa3atividadediogo/model/usermodel.dart';
import 'package:sa3atividadediogo/model/emailmodel.dart';
import 'package:sa3atividadediogo/main.dart';

class ConfigSettings {
  List<String> _emails = [];
  List<String> _tarefas = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  bool _darkMode = false;

  List<String> get emails => _emails;
  List<String> get tarefas => _tarefas;
  TextEditingController get nameController => _nameController;
  TextEditingController get ageController => _ageController;
  TextEditingController get genderController => _genderController;
  bool get darkMode => _darkMode;

  Future<void> loadEmails() async {
    List<Email> emails = await DatabaseHelper.instance.loadEmails();
    _emails = emails.map((email) => email.email).toList();
  }

  Future<void> loadTarefas(int userId) async {
    List<Tarefa> tarefa = await TarefaController.instance.loadTarefas(userId);
    _tarefas = tarefa.map((tarefa) => tarefa.nome).toList();
    _tarefas = tarefa.map((tarefa) => tarefa.descricao).toList();
  }

  Future<void> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    if (userId != null) {
      loadUserData(userId);
    }
  }

  Future<void> loadUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name$userId') ?? '';
    _ageController.text = prefs.getInt('age$userId')?.toString() ?? '';
    _genderController.text = prefs.getString('gender$userId') ?? '';
  }

  Future<void> saveUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name$userId', _nameController.text);
    prefs.setInt('age$userId', int.tryParse(_ageController.text) ?? 0);
    prefs.setString('gender$userId', _genderController.text);
  }

  Future<void> loadThemeMode(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('isDarkMode$userId') ?? false;
    setAppTheme(); // Chame o método para aplicar o tema
  }

  Future<void> toggleDarkMode(int userId) async {
    _darkMode = !_darkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode$userId', _darkMode);
    setAppTheme(); // Chame o método para aplicar o tema
  }

  void setAppTheme() {
    ThemeData theme = _darkMode ? ThemeData.dark() : ThemeData.light();
    MyApp.setAppTheme(theme);
  }

  Future<void> logout(BuildContext context) async {
    int? userId = await DatabaseHelper.instance.getUserId();
    if (userId != null) {
      saveUserData(userId);
    }
    await DatabaseHelper.instance.logout(context);
  }

  void updateTarefasList(List<Tarefa> tarefas) {
    _tarefas.clear();
    _tarefas.addAll(tarefas.map((tarefa) => tarefa.nome));
  
  }
}
