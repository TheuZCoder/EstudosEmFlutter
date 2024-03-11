import 'package:flutter/material.dart';
import 'add_person_dialog.dart';
import 'person_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Informações de Pessoas'),
        ),
        body: PersonTable(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddPersonDialog();
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
