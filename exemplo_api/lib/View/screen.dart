import 'package:exemplo_api/Controller/Weather_Controller.dart';
import 'package:exemplo_api/Model/Weather_model.dart';
import 'package:flutter/material.dart';
import '../Service/Weather_Service.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = WeatherController();

  // Método chamado quando o estado é inicializado.
  @override
  void initState() {
    super.initState();
    //geolocator
    _fetchWeatherData();
  }

  void _showTemperatureAlert(double temperature) {
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

  // Método assíncrono para buscar os dados de previsão do tempo para uma cidade específica.
  Future<void> _fetchWeatherData() async {
    try {
      final position =
          await Geolocator.getCurrentPosition();
      final latitude = position.latitude;
      final longitude = position.longitude;

      final weatherData =
          await WeatherService().getWeatherbyLocation(latitude, longitude);
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

  // Método responsável por construir a interface de usuário do widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          // Título da barra de aplicativos.
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Form(
                child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: const Text("Favoritos")),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Text("localização")),
                const SizedBox(
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
            )),
          ),
        ));
  }
}
