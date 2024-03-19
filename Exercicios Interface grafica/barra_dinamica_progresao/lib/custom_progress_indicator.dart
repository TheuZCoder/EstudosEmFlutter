import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;

  CustomProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
