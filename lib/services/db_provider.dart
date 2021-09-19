import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider dbProvider = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    List<String> listPath = [documentDirectory.path, "TestDB.db"];
    String path = listPath.join();

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE Client ("
            "id INTEGER PRIMARY KEY,"
            "first_name TEXT,"
            "last_name TEXT,"
            "blocked BIT,"
            ")");
      },
    );
  }
}
