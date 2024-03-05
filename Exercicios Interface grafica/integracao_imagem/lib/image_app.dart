import 'package:flutter/material.dart';
import 'image_viewer.dart';

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizador de Imagens'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyImage(
            imageUrl: 'https://example.com/external_image.jpg',
          ),
          SizedBox(height: 20.0),
          MyImage(
            imagePath: 'assets/local_image.jpg',
          ),
        ],
      ),
    );
  }
}
