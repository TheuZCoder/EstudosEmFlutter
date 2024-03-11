import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Adicione a ação desejada para o botão
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star),
            SizedBox(width: 8.0),
            Text('Elevated Button'),
          ],
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Adicione a ação desejada para o botão
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.green,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star),
            SizedBox(width: 8.0),
            Text('Text Button'),
          ],
        ),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Adicione a ação desejada para o botão
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red, side: BorderSide(color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star),
            SizedBox(width: 8.0),
            Text('Outlined Button'),
          ],
        ),
      ),
    );
  }
}
