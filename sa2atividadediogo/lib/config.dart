// SettingsPage
import 'package:flutter/material.dart';
import 'package:sa2atividadediogo/DataBaseHelper.dart';
import 'package:sa2atividadediogo/login.dart';
import 'package:sa2atividadediogo/model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> _emails = [];

  @override
  void initState() {
    super.initState();
    _loadEmails();
  }

  Future<void> _loadEmails() async {
    List<Email> emails = await DatabaseHelper.instance.loadEmails();
    setState(() {
      _emails = emails.map((email) => email.email).toList();
    });
  }

   Future<void> _logout() async {
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
            onPressed: _logout
             ,
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
          ],
        ),
      ),
    );
  }
}
