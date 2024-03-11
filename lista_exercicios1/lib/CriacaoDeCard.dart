import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProductScreen(),
    );
  }
}

class MyProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos Fictícios'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MyProductCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Produto 1',
            description: 'Descrição do Produto 1',
          ),
          MyProductCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Produto 2',
            description: 'Descrição do Produto 2',
          ),
          MyProductCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Produto 3',
            description: 'Descrição do Produto 3',
          ),
        ],
      ),
    );
  }
}

class MyProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const MyProductCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
