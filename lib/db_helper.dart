

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseProvider {
  var _userDatabaseName = "fitnessDatabase";
  var _userTableName = "workoutsTable";
  var _version = 1;
  late Database database;


  Future<void> open() async {
    database = await openDatabase(
      _userDatabaseName,
      version: _version,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_userTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          type TEXT,
          name TEXT,
          img_path TEXT,
          main_img_path TEXT,
          repetitions INTEGER,
          calories INTEGER,
          description TEXT
        );
      ''');
      },
    );
  }

  Future<void> addWorkoutData(String type, String name, String imgPath, String main_img_path ,int repetitions, String calories, String description) async {
    // Ensure that the database is already opened
    if (database == null) {
      throw Exception("Database is not open!");
    }

    try {
      // Insert data into the database
      await database.insert(
        _userTableName,
        {
          'type': type,
          'name': name,
          'img_path': imgPath,
          'main_img_path' : main_img_path,
          'repetitions': repetitions,
          'calories': calories,
          'description': description,
        },
      );
      print('Data added successfully');
    } catch (e) {
      print('Failed to add data: $e');
      // Handle error
    }
  }


  Future<void> updateData(int rep, int id) async {
    if (database == null) {
      throw Exception("Database is not open!");
    }

    await database.execute(
      '''
        UPDATE $_userTableName
        SET 'repetitions' = $rep
        WHERE id = $id;
      '''
    );
  }

  Future<void> updateImage() async {
    if (database == null) {
      throw Exception("Database is not open!");
    }

    await database.execute(
        '''
        UPDATE $_userTableName
        SET 'main_img_path' = 'assets/images/main/oppositeArmMain.png'
        WHERE id = 22;
      '''
    );
  }



  Future<List<Map<String, dynamic>>> getListType(String type) async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    List<Map<String, dynamic>> filteredList = [];
    for (var userMap in userMaps) {
      if (userMap['type'] == type) {
        filteredList.add(userMap);
      }
    }
    return filteredList;
  }









  Future<List<Map<String, dynamic>>> getList() async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    return userMaps;
  }




}