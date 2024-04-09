// Importe as bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:sa2atividadediogo/controller/DataBaseHelper.dart';
import 'package:sa2atividadediogo/controller/configSettings.dart';

// Classe SettingsPage para a tela de configurações
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ConfigSettings _configSettings = ConfigSettings();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _configSettings.loadEmails();
    await _configSettings.loadUserId();
    int? userId = await DatabaseHelper.instance.getUserId();
    if (userId != null) {
      await _configSettings.loadThemeMode(userId);
    }
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
              _configSettings.logout(context);
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
                itemCount: _configSettings.emails.length,
                itemBuilder: (context, index) {
                  String email = _configSettings.emails[index];
                  return ListTile(
                    title: Text(email),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _configSettings.nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _configSettings.ageController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _configSettings.genderController,
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
                      await _configSettings.saveUserData(userId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dados salvos com sucesso!')),
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
                IconButton(
                  icon: Icon(_configSettings.darkMode
                      ? Icons.light_mode
                      : Icons.dark_mode),
                  onPressed: () async {
                    int? userId = await DatabaseHelper.instance.getUserId();
                    if (userId != null) {
                      setState(() {
                        _configSettings.toggleDarkMode(userId);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _configSettings.darkMode
                                ? 'Tema claro ativado'
                                : 'Tema escuro ativado',
                          ),
                        ),
                      );
                    }
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
