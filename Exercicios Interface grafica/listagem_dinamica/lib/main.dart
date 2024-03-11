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
          title: Text('Listagem Dinâmica Flutter'),
        ),
        body: MyList(),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text(items[index]),
            subtitle: Text('Informação fictícia'),
            onTap: () {
              // Ação quando um item é tocado
              print('Item $index tocado!');
            },
          ),
        );
      },
    );
  }
}
