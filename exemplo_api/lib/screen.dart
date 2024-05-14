import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:charts_flutter/flutter.dart' as charts;
// Importa o serviço WeatherService, que é responsável por obter os dados de previsão do tempo da API.
import 'service.dart';

// Classe StatefulWidget que representa o widget de previsão do tempo.
class WeatherScreen extends StatefulWidget {
  // Sobrescreve o método createState para criar e retornar uma instância do estado do widget.
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

// Classe que representa o estado do widget de previsão do tempo.
class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _cityController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Instância do serviço WeatherService para obter os dados de previsão do tempo.
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  // Mapa que armazenará os dados de previsão do tempo.
  late Map<String, dynamic> _weatherData;

  // Método chamado quando o estado é inicializado.
  @override
  void initState() {
    super.initState();
    _weatherData = {
      'name': '',
      'main': {'temp': 0},
      'weather': [
        {'description': ''}
      ],
      "coord": {"lon": -122.4194, "lat": 37.7749},
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "main": {
        "temp": 289.99,
        "feels_like": 289.71,
        "temp_min": 285.71,
        "temp_max": 297.97,
        "pressure": 1013,
        "humidity": 76
      },
      "visibility": 10000,
      "wind": {"speed": 4.02, "deg": 229, "gust": 6.71},
      "clouds": {"all": 20},
      "sys": {
        "type": 2,
        "id": 2017837,
        "country": "US",
        "sunrise": 1715691615,
        "sunset": 1715742718
      },
      "timezone": -25200,
      "id": 5391959,
      "name": "San Francisco",
      "cod": 200
    };
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
          await html.window.navigator.geolocation.getCurrentPosition();
      final latitude = position.coords!.latitude;
      final longitude = position.coords!.longitude;

      final weatherData =
          await _weatherService.getWeatherbyLocation(latitude, longitude);

      setState(() {
        _weatherData = weatherData;
      });

      // Verifica se a temperatura está abaixo de 20 graus e exibe o alerta, se necessário.
      if (_weatherData['main']['temp'] - 273 < 26) {
        _showTemperatureAlert(_weatherData['main']['temp'] - 273);
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
                TextFormField(
                    controller: _cityController,
                    decoration:
                        const InputDecoration(labelText: "Insira a Cidade"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira a Cidade';
                      }
                    }),
                ElevatedButton(
                    onPressed: () {
                      _fetchWeatherData();
                    },
                    child: const Text("Buscar")),
                SizedBox(
                  height: 12,
                ),

                _weatherData == null
                    ? Center(child: Text(""))
                    : Text(
                        'City: ${_weatherData['name']}'), // Exibe o nome da cidade.
                Text(
                    'Temperature: ${(_weatherData['main']['temp'] - 273).toStringAsFixed(2)} °C'), // Exibe a temperatura em graus Celsius.
                Text(
                    'Description: ${_weatherData['weather'][0]['description']}'), // Exibe a descrição do clima.
                Text(
                    'Feels Like: ${(_weatherData['main']['feels_like'] - 273).toStringAsFixed(2)} °C'), // Sensação térmica em graus Celsius.
                Text(
                    'Min Temperature: ${(_weatherData['main']['temp_min'] - 273).toStringAsFixed(2)} °C'), // Temperatura mínima em graus Celsius.
                Text(
                    'Max Temperature: ${(_weatherData['main']['temp_max'] - 273).toStringAsFixed(2)} °C'), // Temperatura máxima em graus Celsius.
                Text(
                    'Pressure: ${_weatherData['main']['pressure']} hPa'), // Pressão atmosférica em hPa.
                Text(
                    'Humidity: ${_weatherData['main']['humidity']}%'), // Umidade em percentual.
                Text(
                    'Wind Speed: ${_weatherData['wind']['speed']} m/s'), // Velocidade do vento em metros por segundo.
                Text(
                    'Cloudiness: ${_weatherData['clouds']['all']}%'), // Nuvens em percentual.
                Text(
                    'Visibility: ${_weatherData['visibility']} meters'), // Visibilidade em metros.
                Text('Country: ${_weatherData['sys']['country']}'), // País.
                Text(
                    'Sunrise: ${_weatherData['sys']['sunrise']}'), // Nascer do sol (timestamp Unix).
                Text(
                    'Sunset: ${_weatherData['sys']['sunset']}'), // Pôr do sol (timestamp Unix).
              ],
            )),
          ),
        ));
  }
}
