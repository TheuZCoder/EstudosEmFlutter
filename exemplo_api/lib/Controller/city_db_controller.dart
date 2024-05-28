import 'package:exemplo_api/Model/CityModel.dart';
import 'package:exemplo_api/Service/DataBaseCity.dart';

class CityDbController {
  //atributos
  final List<City> _cityList = [];
  final CityDbService _service = CityDbService();
  //get citites
  List<City> cities() => _cityList;

  //metodos
  //list from db

  Future<List<City>> list() async {
    List<Map<String, dynamic>>maps = await _service.listCity();
    for (Map<String, dynamic> map in maps) {
      _cityList.add(City.fromMap(map));
    }
    return _cityList;
  }

  //insert

  Future<void> insert(City city) async {
    try {
      await _service.insertCity(city);
      _cityList.add(city);
    } catch (e) {
      print(e);
    }
  }

  //delete

  Future<void> delete(String city) async {
    try {
      await _service.deleteCity(city);
      _cityList.remove(city);
    } catch (e) {
      print(e);
    }
  }

  //update

  Future<void> update(City city) async {
    try {
      await _service.updateCity(city);
      _cityList.removeWhere((element) => element.cityName == city.cityName);
      _cityList.add(city);
    } catch (e) {
      print(e);
    }
  }
}