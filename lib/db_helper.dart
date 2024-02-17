

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseProvider {
  var _userDatabaseName = "kullanicilar";
  var _userTableName = "user";
  var _version = 1;
  late Database database;


  Future<void> open() async {
    database = await openDatabase(_userDatabaseName,
      version: _version,onCreate: (db,version){
      db.execute('''
      CREATE TABLE kullanicilar (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    isim TEXT,
    soyisim TEXT
);
      ''');
        }
    );
  }

  Future<void> addData(String name, String surname) async {
    // Ensure that the database is already opened
    if (database == null) {
      throw Exception("Database is not open!");
    }

    try {
      // Insert data into the database
      await database.insert(
        'kullanicilar',
        {'isim': name, 'soyisim': surname},
      );
      print('Data added successfully');
    } catch (e) {
      print('Failed to add data: $e');
      // Handle error
    }
  }

  Future<List> getList() async{
    List<Map> userMaps = await database.query(_userDatabaseName);
    return userMaps;
  }




}