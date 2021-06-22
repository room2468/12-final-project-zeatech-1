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
      CREATE TABLE akun (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
      )
    ''');
    await db.execute('''
      CREATE TABLE informasi_akun (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        akun_id INTEGER NOT NULL,
        pemasukan INT,
        pengeluaran INT,
        FOREIGN KEY (akun_id) REFERENCES akun (id),
      )
    ''');
    await db.execute('''
      CREATE TABLE transaksi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        akun_id INTEGER NOT NULL,
        besaran_transaksi INTEGER,
        jenis_transaksi TEXT,
        tanggal_transaksi TEXT,
      )
    ''');

    // TODO: Make trigger after akun insert and transaksi insert
  }

  // TODO: Make CRUD function

  Future close() async => _database.close();
}
