import 'dart:io';

import 'package:flutter_fam_expenseslog/model/expense_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider dbProvider = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    // List<String> listPath = [documentDirectory.path, "TestDB.db"];
    // String path = listPath.join();

    String path = documentDirectory.path + "TestDB.db";

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE expense2 ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title TEXT,"
            "desc TEXT,"
            "date DATETIME"
            ")");
      },
    );
  }

  insertData2(ExpenseModel expenseModel) async {
    final db = await database;
    var res = await db.rawInsert("INSERT into expense2 (title, desc, date)"
        "VALUES (${expenseModel.title}, ${expenseModel.desc}, ${expenseModel.date})");
    return res;
  }

  Future insertData(ExpenseModel expenseModel) async {
    final db = await database;
    var res = await db.insert("expense2", expenseModel.toJson());
    return res;
  }

  selectData(int id) async {
    final db = await database;
    var res = await db.query("expense2", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ExpenseModel.fromMap(res.first) : null;
  }

  Future<List<ExpenseModel>> selectAllData() async {
    final db = await database;
    var res = await db.query("expense2");
    List<ExpenseModel> dataAll =
        res.isNotEmpty ? res.map((e) => ExpenseModel.fromMap(e)).toList() : [];
    return dataAll;
  }

  Stream<List<ExpenseModel>> streamData() {
    return Stream.periodic(Duration(seconds: 1)).asyncMap((event) => selectAllData());
  }

  Future updateData(ExpenseModel expenseModel) async {
    final db = await database;
    var res = await db.update(
      "expense2",
      expenseModel.toJson(),
      where: "id = ?",
      whereArgs: [expenseModel.id],
    );
    return res;
  }

  Future deleteData(int id) async {
    final db = await database;
    db.delete("expense2", where: "id = ?", whereArgs: [id]);
  }

  deleteAllData() async {
    final db = await database;
    db.rawDelete("Delete * from expense2");
  }
}
