import 'package:flutter/material.dart';
import 'package:sa3atividadediogo/Controller/TarefaController.dart';
import 'package:sa3atividadediogo/Model/tarefaModel.dart';
import 'package:sa3atividadediogo/Model/userModel.dart';
import 'package:sa3atividadediogo/controller/DataBaseHelper.dart';
import 'package:sa3atividadediogo/controller/config.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ConfigSettings _configSettings = ConfigSettings();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _configSettings.loadEmails();
    int? userId = await DatabaseHelper.instance.getUserId();
    if (userId != null) {
      await _configSettings.loadThemeMode(userId);
      List<Tarefa> tarefas =
          await TarefaController.instance.loadTarefas(userId);
      _configSettings.updateTarefasList(tarefas);
    }
     setState(() {});
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza todos os elementos verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza todos os elementos horizontalmente
          children: [
            Text(
              'Lista de Emails Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildEmailsList(),
            SizedBox(height: 20),
            Text(
              'Lista de Tarefas Cadastradas:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTarefasList(),
            SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'nome'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'descricao'), 
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String nome = _nomeController.text.trim();
                String descricao = _descricaoController.text.trim();
                int? userId = await DatabaseHelper.instance.getUserId();
                if (nome == '' || descricao == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Os campos precisam estar preenchidos para registrar'),
                    ),
                  );
                }
                if (userId != null) {
                  await TarefaController.instance.insertTarefa(
                    Tarefa(
                      nome: nome,
                      descricao: descricao,
                    ),
                    userId,
                  );
                  await _loadSettings();
                  _nomeController.clear();
                  _descricaoController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tarefa registrada com sucesso!'),
                    ),
                  );
                  List<Tarefa> tarefas =
                      await TarefaController.instance.loadTarefas(userId);
                  _configSettings.updateTarefasList(tarefas);
                  setState(() {}); 
                }
              },
              child: Text('Registrar'),
            ),
            SizedBox(height: 20),
            _buildUserDataFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailsList() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: _configSettings.emails.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          String email = _configSettings.emails[index];
          return ListTile(
            title: Text(email),
          );
        },
      ),
    );
  }

  Widget _buildTarefasList() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: _configSettings.tarefas.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          String tarefa = _configSettings.tarefas[index];
          return ListTile(
            title: Text(tarefa),
          );
        },
      ),
    );
  }

  Widget _buildUserDataFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    SnackBar(
                      content: Text('Dados salvos com sucesso!'),
                    ),
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
    );
  }
}
