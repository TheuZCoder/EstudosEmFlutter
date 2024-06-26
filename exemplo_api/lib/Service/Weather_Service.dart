import 'dart:convert';
import 'package:exemplo_api/Model/Weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  final String apiKey = 'e83b3c4c08285bf87b99f9bbc0abe3f0';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      //função para tranformar kelvin em celsius
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> getWeatherbyLocation(num? lat, num? lon) async {
    final url =Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<bool> findCity(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      final weather = Weather.fromJson(jsonDecode(response.body));
      if(weather.name == city){
        return true;
      }
      return false;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
