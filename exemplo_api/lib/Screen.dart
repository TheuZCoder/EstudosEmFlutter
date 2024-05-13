import 'package:exemplo_api/Service.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService(
    apiKey: '681126f28e7d6fa3a7cfe0da0671e599',
    baseUrl: 'https://api.openweathermap.org/data/2.5',
  );

  late Map<String, dynamic> _weatherData;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
    _weatherData = {
      'name': '',
      'main': {'temp': 0},
      'weather': [{'description': ''}],
    };
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData(String city) async {
    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Nome da cidade',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final city = _cityController.text;
              _fetchWeatherData(city);
            },
            child: const Text('Buscar'),
          ),
          const SizedBox(height: 16),
          _weatherData == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('City: ${_weatherData['name']}'),
                      Text('Temperature: ${_weatherData['main']['temp'] - 273} °C'),
                      Text('Description: ${_weatherData['weather'][0]['description']}'),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
