import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey;
  final String baseUrl;

  WeatherService({required this.apiKey, required this.baseUrl});

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getWeatherByLocation(
      double lat, double lon) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double lat = position.latitude;
    double lon = position.longitude;

    final url = Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
