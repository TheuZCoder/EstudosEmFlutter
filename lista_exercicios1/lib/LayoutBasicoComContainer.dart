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
          title: Text('Layout Básico com Container'),
        ),
        body: MyContainerLayout(),
      ),
    );
  }
}

class MyContainerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            height: 50,
            width: 150,
            color: Colors.yellow,
            margin: EdgeInsets.all(8.0),
          ),
        ],
      ),
    );
  }
}
