import 'package:flutter/material.dart';
import 'progress_indicator_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressIndicatorExample(),
    );
  }
}
