import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String? imageUrl;
  final String? imagePath;

  MyImage({this.imageUrl, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Image.network(
            imageUrl!,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          )
        : Image.asset(
            imagePath!,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          );
  }
}
