import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Página com ListView'),
        ),
        body: MyListViewPage(),
      ),
    );
  }
}

class MyListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Informações fictícias'),
            onTap: () {
              // Ação ao clicar no item (opcional)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Clicou no item ${index + 1}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
