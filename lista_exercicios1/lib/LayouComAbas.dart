import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> {
  final List<Tab> myTabs = [
    Tab(text: 'Aba 1'),
    Tab(text: 'Aba 2'),
    Tab(text: 'Aba 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Página com Abas'),
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: [
           
            Center(
              child: Text('Conteúdo da Aba 1'),
            ),

            
            Center(
              child: Text('Conteúdo da Aba 2'),
            ),

           
            Center(
              child: Text('Conteúdo da Aba 3'),
            ),
          ],
        ),
      ),
    );
  }
}
