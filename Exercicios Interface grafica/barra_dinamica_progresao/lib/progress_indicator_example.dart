import 'package:barra_dinamica_progresao/custon_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'custom_progress_indicator.dart';

class ProgressIndicatorExample extends StatefulWidget {
  @override
  _ProgressIndicatorExampleState createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  double _progressValue = 0.0;

  void _startTask() {
    // Simula uma tarefa assíncrona
    for (double progress = 0.0; progress <= 1.0; progress += 0.01) {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          _progressValue = progress;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Progresso Dinâmica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgressIndicator(value: _progressValue),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _startTask();
              },
              child: Text('Iniciar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
