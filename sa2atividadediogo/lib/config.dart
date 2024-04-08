import 'package:flutter/material.dart';
import 'package:sa2atividadediogo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sa2atividadediogo/DataBaseHelper.dart';
import 'package:sa2atividadediogo/login.dart';
import 'package:sa2atividadediogo/model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> _emails = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadEmails();
    _loadUserId(); // Carrega o ID do usuário ao iniciar a página
    _loadThemeMode(); // Carrega o tema ao iniciar a página
  }

  Future<void> _loadEmails() async {
    List<Email> emails = await DatabaseHelper.instance.loadEmails();
    setState(() {
      _emails = emails.map((email) => email.email).toList();
    });
  }

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    if (userId != null) {
      _loadUserData(userId); // Carrega os dados do usuário com base no ID
    }
  }

  Future<void> _loadUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name$userId') ?? '';
      _ageController.text = prefs.getInt('age$userId')?.toString() ?? '';
      _genderController.text = prefs.getString('gender$userId') ?? '';
    });
  }

  Future<void> _saveUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name$userId', _nameController.text);
    prefs.setInt('age$userId', int.tryParse(_ageController.text) ?? 0);
    prefs.setString('gender$userId', _genderController.text);
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      // Configura o tema do aplicativo com base no modo atual
      _setAppTheme();
    });
  }

  Future<void> _toggleThemeMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool newMode = !_isDarkMode;
  prefs.setBool('isDarkMode', newMode);
  setState(() {
    _isDarkMode = newMode;
    _setAppTheme(); // Configura o tema do aplicativo após a troca
    MyApp.setAppTheme(_isDarkMode ? ThemeData.dark() : ThemeData.light()); // Atualiza o tema na classe MyApp
  });
}

  void _setAppTheme() {
    // Define o tema do aplicativo com base no estado _isDarkMode
    ThemeData theme = _isDarkMode ? ThemeData.dark() : ThemeData.light();
    MyApp.setAppTheme(theme);
  }

  Future<void> _logout() async {
    int? userId = await DatabaseHelper.instance.getUserId();
    if (userId != null) {
      _saveUserData(userId);
    }
    await DatabaseHelper.instance.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lista de Emails Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _emails.length,
                itemBuilder: (context, index) {
                  String email = _emails[index];
                  return ListTile(
                    title: Text(email),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Sexo'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    int? userId = await DatabaseHelper.instance.getUserId();
                    if (userId != null) {
                      await _saveUserData(userId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dados salvos com sucesso!')),
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
                IconButton(
                  icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () {
                    _toggleThemeMode();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _isDarkMode
                              ? 'Tema claro ativado'
                              : 'Tema escuro ativado',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
