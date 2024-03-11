import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Substitua esses Widgets pelos seus próprios Widgets ou telas.
    Placeholder(key: PageStorageKey('Tab1')),
    Placeholder(key: PageStorageKey('Tab2')),
    Placeholder(key: PageStorageKey('Tab3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação Personalizada'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}
