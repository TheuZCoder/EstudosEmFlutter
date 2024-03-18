import 'dart:async';

import 'package:barra_dinamica_progresao/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  @override
  _ProgressIndicatorExampleState createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  double _progressValue = 0.0;
  Timer? _timer;

  void _startTask() {
    const totalDuration = Duration(seconds: 7); // Duração total da tarefa
    const updateInterval = Duration(milliseconds: 100); // Intervalo de atualização

    int steps = (totalDuration.inMilliseconds / updateInterval.inMilliseconds).round();

    _timer?.cancel(); // Cancela qualquer timer existente para evitar sobreposição

    _timer = Timer.periodic(updateInterval, (Timer timer) {
      setState(() {
        _progressValue += 1 / steps;
        if (_progressValue >= 1.0) {
          _progressValue = 1.0;
          timer.cancel(); // Cancela o timer quando a tarefa estiver concluída
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Certifica-se de cancelar o timer ao sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Progresso Dinâmica'),
      ),
      body: Center(
        child: Column(
          
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
