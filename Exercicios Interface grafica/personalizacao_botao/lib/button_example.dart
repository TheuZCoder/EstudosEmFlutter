import 'package:flutter/material.dart';
import 'package:personalizacao_botao/custon_buttons.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalização de Botões'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyElevatedButton(),
            SizedBox(height: 16.0),
            MyTextButton(),
            SizedBox(height: 16.0),
            MyOutlinedButton(),
          ],
        ),
      ),
    );
  }
}
