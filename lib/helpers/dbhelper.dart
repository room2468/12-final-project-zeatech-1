import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// TODO: Make Model
// TODO: Import model
import 'package:zeatech/models/informasi.dart';
import 'package:zeatech/models/transaksi.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  // Membuat database local dengan nama dompet.db
  // Berfungsi untuk menyimpan data transaksi pemasukan dan pengeluaran user
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'dompet.db';

    var dompetDatabase = openDatabase(path, version: 3, onCreate: _createDb);

    return dompetDatabase;
  }

  // Pembuatan tabel informasi dan transaksi
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS info (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pemasukan INTEGER,
        pengeluaran INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS transaksi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nominal INTEGER,
        jenistransaksi TEXT,
        tanggaltransaksi TEXT
      )
    ''');
    // Untuk menambahkan data awal pada tabel informasi
    // Menyimpan nilai pemasukan dan pengeluaran
    await db.rawInsert('INSERT INTO info (pemasukan, pengeluaran) VALUES (0, 0)');
    // TODO: Make trigger after akun insert and transaksi insert
  }

  // TODO: Make CRUD function

  // Select data from databases
  Future<List<Map<String, dynamic>>> selectHistory() async {
    // Untuk mengambil semua data pada tabel transaksi
    // Digunakan untuk menampilkan data history transaksi pada halaman home
    Database db = await this.initDb();
    var mapList = await db.query('transaksi', orderBy: 'tanggaltransaksi');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectInfo() async {
    Database db = await this.initDb();
    var mapList = await db.query('info', orderBy: 'id');
    return mapList;
  }

// Create data on databases
  Future<int> insert(Transaksi object) async {
    // Untuk memasukkan data transaksi pada tabel transaksi
    // Data diambil dari halaman input
    Database db = await this.initDb();
    int count = await db.insert('transaksi', object.toMap());
    return count;
  }

  //create data di tabel informasi
  Future<int> insertInfo(Informasi object) async {
    Database db = await this.initDb();
    int count = await db.insert('info', object.toMap());
    return count;
  }

// Update databases di tabel informasu
  Future<int> update(Informasi object) async {
    // Digunakan untuk mengupdate data pada tabel informasi
    // Kolom pemasukan dan pengeluaran diupdate berdasarkan transaksi yang ditambahkan
    Database db = await this.initDb();
    int count = await db
        .update('info', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //update database di tabel transaksi
   Future<int> updateTransaksi(Transaksi object) async {
    Database db = await this.initDb();
    int count = await db
        .update('transaksi', object.toMap(), where: 'id=? ', whereArgs: [object.id]);
    return count;
  }

  //delete database transaksi
  Future<int> deleteTransaksi(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('transaksi', where: 'id=?', whereArgs: [id]);
    return count;
  }


  
  Future<List<Transaksi>> getHistoryList() async {
    var historyMapList = await selectHistory();
    int count = historyMapList.length;
    List<Transaksi> historyList = List<Transaksi>();
    for (int i = 0; i < count; i++) {
      historyList.add(Transaksi.fromMap(historyMapList[i]));
    }
    return historyList;
  }

  Future<List<Informasi>> getInfo() async {
    var infoMapList = await selectInfo();
    int count = infoMapList.length;
    List<Informasi> infoList = List<Informasi>();
    for (int i = 0; i < count; i++) {
      infoList.add(Informasi.fromMap(infoMapList[i]));
    }
    return infoList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future close() async => _database.close();
}
