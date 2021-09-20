import 'dart:io';

import 'package:flutter_fam_expenseslog/model/expense_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper? _dbHelper;
  static Database? _database;

  DBHelper._createObject();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createObject();
    }
    return _dbHelper!;
  }

  Future<Database> initDb() async {
    // buat database dan lokasinya
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'expense.db';

    // create, read database
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    // mengembalikan nilai
    return todoDatabase;
  }

  // buat tabel baru dengan nama expense
  void _createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE expense (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT, date DATETIME)''',
    );
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database!;
  }

  // read database
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('expense', orderBy: 'title');
    return mapList;
  }

  //create databases
  Future<int> insert(ExpenseModel object) async {
    Database db = await this.database;
    int count = await db.insert('expense', object.toJson());
    return count;
  }

  //update databases
  Future<int> update(ExpenseModel object) async {
    Database db = await this.database;
    int count = await db.update('expense', object.toJson(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('expense', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<ExpenseModel>> getContactList() async {
    var contactMapList = await select();
    int count = contactMapList.length;
    List<ExpenseModel>? contactList;
    for (int i = 0; i < count; i++) {
      contactList!.add(ExpenseModel.fromMap(contactMapList[i]));
    }
    return contactList!;
  }
}
