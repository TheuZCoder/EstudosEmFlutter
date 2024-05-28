import 'package:exemplo_api/Controller/Weather_Controller.dart';
import 'package:exemplo_api/Controller/city_db_controller.dart';
import 'package:exemplo_api/Model/CityModel.dart';
import 'package:exemplo_api/Model/Weather_model.dart';
import 'package:exemplo_api/Service/Weather_Service.dart';
import 'package:exemplo_api/View/Details_weather_screen.dart';
import 'package:flutter/material.dart';

class SearchScreenState extends StatefulWidget {
  const SearchScreenState({super.key});

  @override
  State<SearchScreenState> createState() => _SearchScreenStateState();
}

class _SearchScreenStateState extends State<SearchScreenState> {
  final TextEditingController _cityController = TextEditingController();
  final CityDbController _dbcontroller = CityDbController();
  final _controller = WeatherController();
  final _formKey = GlobalKey<FormState>();

  void _showTemperatureAlert(int temperature) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta de Temperatura'),
          content: Text(
              'A temperatura está abaixo de 26 graus (${(temperature - 273).toStringAsFixed(2)} °C).'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo de alerta.
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _fetchWeatherData() async {
    try {
      final city = _cityController.text;
      if (city.isEmpty) return;

      final weatherData = await WeatherService().getWeather(city);
      setState(() {
        _controller.weatherList.add(Weather.fromJson(weatherData));
      });

      final temperature = weatherData['main']['temp'];
      if (temperature != null && temperature - 273 < 26) {
        _showTemperatureAlert(temperature);
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  Future<void> findCity(String city) async {
    if (await _controller.findCity(city)) {
      //snackbar
      City cityadd = City(cityName: city, favoritescities: false);
      _dbcontroller.insert(cityadd);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cidade encontrada'),
          duration: Duration(seconds: 1),
        ),
      );
      //navigation to details
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreenState(cityName: city)));
    } else {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cidade não encontrada'),
          duration: Duration(seconds: 1),
        ),
      );
      _cityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: Center(
        // Center widget added
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center alignment added
            children: [
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: "Insira a Cidade"),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Insira a Cidade';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    findCity(_cityController.text);
                  }
                },
                child: const Text('Search'),
                
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: _dbcontroller.list(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    
                  }
                })
            ],
          ),
        ),
      ),
    );
  }
}
