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
          title: Text('Organização com Row e Column'),
        ),
        body: MyOrganizedLayout(),
      ),
    );
  }
}

class MyOrganizedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Organização Vertical',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, size: 50, color: Colors.yellow),
              Text('Item 1'),
              Image.network('https://via.placeholder.com/50'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, size: 50, color: Colors.yellow),
              Text('Item 2'),
              Image.network('https://via.placeholder.com/50'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, size: 50, color: Colors.yellow),
              Text('Item 3'),
              Image.network('https://via.placeholder.com/50'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Organização Horizontal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, size: 50, color: Colors.yellow),
              Text('Item 4'),
              Image.network('https://via.placeholder.com/50'),
            ],
          ),
        ],
      ),
    );
  }
}
