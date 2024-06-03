import 'package:exemplo_api/View/Details_weather_screen.dart';
import 'package:exemplo_api/View/Favorites_screen.dart';
import 'package:exemplo_api/View/Seach_screen.dart';
import 'package:flutter/material.dart';
import 'View/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
      routes: {
        '/home': (context) => WeatherScreen(),
        '/favorites': (context) => const FavoritesScreenState(),
        '/search': (context) => const SearchScreenState(),
      },
    );
  }
}
