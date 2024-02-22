import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}


class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}


class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}


class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero = TextEditingController();
  String _resultado = '';
  bool _mostrarBotao = false;
  int _contadorTentativas = 1;


  void _calcular(String operacao) {
    double Numero = double.tryParse(_controllerNumero.text) ?? 0.0;
    double? resultado;
    int _random_numero = Random().nextInt(10) + 1;

    setState(() {
    if (operacao == 'RESETAR') {
        _controllerNumero.text = '';
        _resultado = '';
        _mostrarBotao = false;
        _contadorTentativas = 1;
    }
    else if(Numero == _random_numero) {
      _resultado = 'PARABENS VC ACERTOU EM $_contadorTentativas TENTATIVAS!!!';
      _mostrarBotao = true;
      
    }else {
      _resultado = "Você errou eu pensei no numero : $_random_numero Tentativas: $_contadorTentativas";
      _mostrarBotao = false;
      _contadorTentativas++;
    }
    });
      
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da Advinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um Numero:'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('RESULTADO'),
              child: Text('RESULTADO'),
            ),
            SizedBox(height: 10.0),
            Visibility(
              visible: _mostrarBotao,
              child: ElevatedButton(
                onPressed: () => _calcular('RESETAR'),
                child: Text('RESETAR'),
              ),
            ),
            SizedBox(height: 16.0), //CAIXA DE TEXTO ONDE APARECERA O RESULTADO
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}




