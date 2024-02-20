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
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';


  void _calcular(String operacao) {
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double? resultado;


    setState(() {
      if (operacao == "Somar") {
        resultado = numero1 + numero2;
      } else if (operacao == 'Sub') {
        resultado = numero1 - numero2;
      } else if (operacao == "Mult"){
        resultado = numero1 * numero2;
      }  else if (operacao == "Potencia"){
        resultado = pow(numero1, numero2) as double?; 
      } else if (operacao == "Raiz"){
        if (numero1 <= 0 && numero2 % 2 != 0) {
        resultado = pow(numero1 , 1/numero2) as double?;
        }  else {
          _resultado = resultado != null ? 'O resultado é $resultado' : "Operação Invalida";
        }
      }else {
        // if (numero2 != 0) {
        //   resultado = numero1 / numero2;
        // } else{
        //   resultado = null;
        // }
        resultado = numero1 / numero2 !=0 ? numero1/numero2 : resultado = null;
      }
      _resultado = resultado != null ? 'O Resultado é $resultado' : "Operação Invalida";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Somar'),
              child: Text('Somar'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Sub'),
              child: Text('Subtrair'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Mult'),
              child: Text('Multiplicar'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Potencia'),
              child: Text('Potencia'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Raiz'),
              child: Text('Raiz'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}




