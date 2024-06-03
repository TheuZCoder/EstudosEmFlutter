import 'package:exemplo_api/Model/CityModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CityDbService {
  final String DATABASE_NAME = 'citydb.db';
  final String TABLE_NAME = 'city';
  final String CREATE_TABLE_SCRIPT = """
    CREATE TABLE city(
      cityname TEXT PRIMARY KEY,
      favoritescities BOOLEAN
    )""";

    //metodo open database

    Future<Database> _openDatabase() async {
      return await openDatabase(
        join(await getDatabasesPath(), DATABASE_NAME),
        onCreate: (db, version) => CREATE_TABLE_SCRIPT,
        version: 1
      );
    }

    //crud

    Future<void> insertCity(City city) async {
      try {
      final db = await _openDatabase();
      await db.insert(TABLE_NAME, city.toMap());
      db.close();
      } catch (e) {
        print(e);
      }
    }
    //list

    Future<List<Map<String, dynamic>>> listCity() async {
      final db = await _openDatabase();
      List<Map<String,dynamic>> maps = await db.query(TABLE_NAME);
      return maps;
    }

    //delete

    Future<void> deleteCity(String city) async {
      final db = await _openDatabase();
      await db.delete(TABLE_NAME, where: 'cityname = ?', whereArgs: [city]);
      db.close();
    }
    //update

    Future<void> updateCity(City city) async {
      final db = await _openDatabase();
      await db.update(TABLE_NAME, city.toMap(), where: 'cityname = ?', whereArgs: [city.cityName]);
      db.close();
    }
}