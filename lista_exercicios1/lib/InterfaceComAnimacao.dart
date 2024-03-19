import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimatedButtonPage(),
    );
  }
}

class MyAnimatedButtonPage extends StatefulWidget {
  @override
  _MyAnimatedButtonPageState createState() => _MyAnimatedButtonPageState();
}

class _MyAnimatedButtonPageState extends State<MyAnimatedButtonPage> {
  double _marginLeft = 0.0;
  Color _buttonColor = Colors.blue;

  void _onButtonPressed() {
    setState(() {
      _marginLeft = _marginLeft == 0.0 ? 50.0 : 0.0;
      _buttonColor = _buttonColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação de Botão'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          margin: EdgeInsets.only(left: _marginLeft),
          child: ElevatedButton(
            onPressed: _onButtonPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_buttonColor),
            ),
            child: Text('Clique-me'),
          ),
        ),
      ),
    );
  }
}
