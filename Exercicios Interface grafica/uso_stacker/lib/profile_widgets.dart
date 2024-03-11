import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Capa do perfil
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: NetworkImage(
                'https://example.com/cover_image.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Conteúdo do perfil
        Positioned(
          top: 150.0,
          left: 16.0,
          right: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto de perfil redonda
              MyCircularAvatar(
                imageUrl: 'https://example.com/profile_image.jpg',
                radius: 50.0,
              ),
              SizedBox(height: 16.0),
              // Informações do usuário
              Text(
                'Nome do Usuário',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Descrição do usuário.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyCircularAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  MyCircularAvatar({required this.imageUrl, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
