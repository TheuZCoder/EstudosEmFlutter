import 'package:exemplo_api/Controller/Weather_Controller.dart';
import 'package:exemplo_api/Model/Weather_model.dart';
import 'package:exemplo_api/Service/Weather_Service.dart';
import 'package:flutter/material.dart';

class SearchScreenState extends StatefulWidget {
  const SearchScreenState({super.key});

  @override
  State<SearchScreenState> createState() => SearchScreenStateState();
}

class SearchScreenStateState extends State<SearchScreenState> {
  TextEditingController _cityController = new TextEditingController();
  final _controller = WeatherController();

  void _showTemperatureAlert(int temperature) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta de Temperatura'),
          content: Text(
              'A temperatura está abaixo de 26 graus (${temperature.toStringAsFixed(2)} °C).'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo de alerta.
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _fetchWeatherData() async {
    try {
      final city = _cityController.text;

      final weatherData =
          await WeatherService().getWeather(city);
      setState(() {
        _controller.weatherList.add(Weather.fromJson(weatherData));
      });
      // Verifica se a temperatura está abaixo de 20 graus e exibe o alerta, se necessário.
      if (weatherData['main']['temp'] - 273 < 26) {
        _showTemperatureAlert(weatherData['main']['temp'] - 273);
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Center( // Center widget added
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center alignment added
          children: [
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: "Insira a Cidade"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira a Cidade';
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _fetchWeatherData();
              },
              child: Text('Search'),
            ),const SizedBox(
                  height: 20,
                ),
                // Construir uma exibição do clima.
                _controller.weatherList.isEmpty
                    ? 
                    Column(
                      children: [
                          const Text('Sem dados de clima'),
                          IconButton(icon: const Icon(Icons.refresh),
                          onPressed: () => 
                          _fetchWeatherData(),
                        )
                      ],
                    )
                    : Column(
                        children: [
                          Text('Cidade: ${_controller.weatherList.last.name}'),
                          Text('Main: ${_controller.weatherList.last.main}'),
                          Text('Descrição: ${_controller.weatherList.last.description}'),
                          Text('Temperatura: ${_controller.weatherList.last.temp.toString()} °C'),
                          Text('Temperatura Máxima: ${_controller.weatherList.last.tempMax.toString()} °C'),
                          Text('Temperatura Mínima: ${_controller.weatherList.last.tempMin.toString()} °C'),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}