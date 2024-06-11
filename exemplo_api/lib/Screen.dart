import 'package:flutter/material.dart';
import 'package:exemplo_api/Service.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
    _weatherData = {
      'name': '',
      'main': {'temp': 0},
      'weather': [
        {'description': ''}
      ],
    };
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData(String city) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherData = weatherData;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o nome da cidade';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Nome da cidade',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _fetchWeatherData(_cityController.text);
                }
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _weatherData == null
                    ? const Center(
                        child: Text('Nenhum dado disponível'),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('City: ${_weatherData['name']}'),
                            Text('Temperature: ${(_weatherData['main']['temp'] - 273.15).toStringAsFixed(2)} °C'),
                            Text('Description: ${_weatherData['weather'][0]['description']}'),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
