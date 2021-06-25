import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:zeatech/helpers/dbhelper.dart';
import 'package:zeatech/models/informasi.dart';
import 'package:zeatech/models/transaksi.dart';
import 'package:zeatech/layouts/input.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbhelper = DbHelper();
  int count = 0;
  List<Informasi> info;
  List<Transaksi> history;
  // @override
  // Widget build(BuildContext context) {
  //   _getInfo();
  //   if (history == null) {
  //     history = List<Transaksi>();
  //   }
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("Money Manager"),
  //       ),
  //       body: Container(
  //         child: ListView(
  //           children: <Widget>[
  //             Container(
  //               width: 350.0,
  //               height: 100.0,
  //               margin: EdgeInsets.fromLTRB(4, 20, 4, 0),
  //               padding: EdgeInsets.only(left: 4, right: 4),
  //               decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.blueGrey),
  //                 borderRadius: BorderRadius.all(Radius.elliptical(10.0, 20.0)),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: <Widget>[
  //                   Column(
  //                     children: [
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
  //                         child: Text("Pemasukan",
  //                             style:
  //                                 TextStyle(color: Colors.blue, fontSize: 15)),
  //                       ),
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
  //                         child: Text(
  //                             "Rp. ${this.info[0].pemasukan.toString()}",
  //                             style:
  //                                 TextStyle(color: Colors.blue, fontSize: 20)),
  //                       )
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
  //                         child: Text("Pengeluaran",
  //                             style:
  //                                 TextStyle(color: Colors.red, fontSize: 15)),
  //                       ),
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
  //                         child: Text(
  //                             "Rp. ${this.info[0].pengeluaran.toString()}",
  //                             style:
  //                                 TextStyle(color: Colors.red, fontSize: 20)),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               color: Colors.white,
  //               alignment: Alignment.topCenter,
  //               margin: EdgeInsets.only(top: 30),
  //               child: Text(
  //                 "Transaksi Terakhir",
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.only(top: 7, left: 8, right: 8),
  //               decoration: const BoxDecoration(
  //                 border: Border(
  //                   bottom: BorderSide(width: 1.0, color: Colors.black),
  //                 ),
  //               ),
  //             ),
  //             Flexible(
  //               child: Container(
  //                 padding: EdgeInsets.fromLTRB(8, 160, 8, 8),
  //                 width: 350.0,
  //                 height: 220.0,
  //                 child: RaisedButton(
  //                   onPressed: () async {
  //                     // var value = await navigateToEntryForm(context, null);
  //                     // if (value != null) {
  //                     //   await dbhelper.insert(value);
  //                     // }
  //                     Database db = await dbhelper.initDb();
  //                     db.rawUpdate(
  //                         'UPDATE informasi SET pemasukan = 10 WHERE id = 1');
  //                     db.rawQuery('SELECT * FROM informasi');
  //                     _getInfo();
  //                   },
  //                   color: Colors.blue[400],
  //                   textColor: Colors.white,
  //                   child: Text(
  //                     "Tambah Tranksaksi",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18.0,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeatech Dompet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Zeatech Dompet'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Kolom Informasi
            Container(
              // width: 350.0,
              height: 100.0,
              margin: EdgeInsets.fromLTRB(4, 10, 4, 0),
              padding: EdgeInsets.only(left: 4, right: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10.0, 20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Kolom Pemasukan
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                        child: Text(
                          "Pemasukan",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Rp. ${this.info[0].pemasukan.toString()}",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  // Kolom Pengeluaran
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                        child: Text(
                          "Pengeluaran",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Rp. ${this.info[0].pengeluaran.toString()}",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Kolom History
            Container(
              color: Colors.white,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "History Transaksi",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            // Menggunakan listview builder
            Expanded(
              child: _createHistory(),
            ),
            // Floating button buat tambah data
            FloatingActionButton(
              onPressed: () async {
                var data = await navigateToEntryForm(context, null);
                if (data != null) {
                  int result = await dbhelper.insert(data);
                  if (result > 0) {
                    _updateHistory();
                    _getInfo();
                  }
                }
              },
              tooltip: "Tambah Data",
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  Future<Transaksi> navigateToEntryForm(
      BuildContext context, Transaksi transaksi) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(transaksi);
    }));
    return result;
  }

  _createHistory() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          
        );
      },
    );
  }

  _updateHistory() async {
    final Future<Database> dbFuture = dbhelper.initDb();
    dbFuture.then((database) {
      Future<List<Transaksi>> historyListFuture = dbhelper.getHistoryList();
      historyListFuture.then((history) {
        setState(() {
          this.history = history;
          this.count = history.length;
        });
      });
    });
  }

  _getInfo() async {
    final Future<Database> dbFuture = dbhelper.initDb();
    dbFuture.then((database) {
      Future<List<Informasi>> infoListFuture = dbhelper.getInfo();
      infoListFuture.then((info) {
        setState(() {
          this.info = info;
        });
      });
    });
  }
}
