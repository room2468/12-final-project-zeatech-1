import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:zeatech/main.dart';
import 'package:zeatech/helpers/dbhelper.dart';
import 'package:zeatech/models/informasi.dart';
import 'package:zeatech/models/transaksi.dart';

class DbTest extends StatefulWidget {
  @override
  _DbTestState createState() => _DbTestState();
}

class _DbTestState extends State<DbTest> {
  DbHelper dbhelper = DbHelper();
  int count = 0;

  // Mengambil data dari tabel transaksi
  // Dan ditampilkan dalam widget
  List<Transaksi> historyList;

  Informasi info;

  @override
  Widget build(BuildContext context) {
    if (historyList == null) {
      historyList = List<Transaksi>();
    }
    // if (info == null) {
    //   info.pemasukan = 0;
    //   info.pengeluaran = 0;
    // }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Use For Test Only || Database Test'),
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: createHistoryList(),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Text('Pemasukan: ${this.info.pemasukan.toString()}'),
      //         Text('Pengeluaran: ${this.info.pengeluaran.toString()}'),
      //       ],
      //     )
      //   ],
      // ),
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(
              'Check query',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              _checkInfo();
            },
          ),
          RaisedButton(
            child: Text('Insert Transaksi'),
            onPressed: _insertTransaction,
          ),
        ],
      ),
    );
  }

  _checkInfo() async {
    Database db = await dbhelper.initDb();
    // print(await db.rawQuery('show tables'));
    // print(await db.rawQuery('SELECT * FROM transaksi'));
    int nominal = await db.rawQuery('SELECT nominal FROM transaksi');
    print(nominal);
  }

  _insertTransaction() async {
    Database db = await dbhelper.initDb();
    await db.rawInsert(
        'INSERT INTO transaksi (nominal, jenis_transaksi, tanggal_transaksi) VALUES (500, "Pemasukan", null)');
    // int nominal = await db.rawQuery('SELECT nominal FROM transaksi');
  }
}
