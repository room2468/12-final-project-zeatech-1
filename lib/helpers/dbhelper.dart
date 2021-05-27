import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// TODO: Make Model
// TODO: Import model

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    var moneyDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return moneyDatabase;
  }

  // Tabel untuk money
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE curency (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price INTEGER,
        stok INTEGER,
        kodebarang TEXT
      )
    ''');
  }

  // TODO: Make CRUD function

  Future close() async => _database.close();
}
