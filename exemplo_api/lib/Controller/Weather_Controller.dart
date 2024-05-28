import 'package:exemplo_api/Model/Weather_model.dart';
import 'package:exemplo_api/Service/Weather_Service.dart';

class WeatherController {

  final List<Weather> _weatherList = [];

  //get 

  List<Weather> get weatherList => _weatherList;

  final WeatherService _service = WeatherService();
  //metodos

  //pegar pela cidade
  Future<void> getWeather(String city) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeather(city));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  //pegar pela localização
  Future<void> getWeatherByLocation(num? lat, num? lon) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeatherbyLocation(lat,lon));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> findCity(String city) async {
   try {
   return await _service.findCity(city);
   } catch (e) {
     print(e);
     return false;
   }
  }
}