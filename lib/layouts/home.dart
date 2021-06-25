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
  void _rebuilt() => setState(() {});

  @override
  Widget build(BuildContext context) {
    // _getInfo();
    if (history == null) {
      history = List<Transaksi>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Manager"),
      ),
      body: FutureBuilder(
          future: dbhelper.selectInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final _data = snapshot.data;
              final _listInfo = List.generate(_data.length, (i) {
                return Informasi(
                  _data[i]['pemasukan'],
                  _data[i]['pengeluaran'],
                );
              });
              int _pemasukan() {
                int _totalPemasukan = 0;

                _listInfo.forEach((transaksi) {
                  _totalPemasukan += transaksi.pemasukan;
                });

                return _totalPemasukan;
              }

              int _pengeluaran() {
                int _totalPengeluaran = 0;

                _listInfo.forEach((transaksi) {
                  _totalPengeluaran += transaksi.pengeluaran;
                });

                return _totalPengeluaran;
              }

              return Column(
                children: [
                  Container(
                    width: 350.0,
                    height: 100.0,
                    margin: EdgeInsets.fromLTRB(4, 20, 4, 0),
                    padding: EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(10.0, 20.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                              child: Text("Pemasukan",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text('Rp. ${_pemasukan()}',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                              child: Text("Pengeluaran",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15)),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text('Rp. ${_pengeluaran()}',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  Container(
                    margin: EdgeInsets.only(top: 7, left: 8, right: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  // Menggunakan listview builder
                  Expanded(
                    child: _createHistory(),
                  ),
                  
                  FloatingActionButton(
                    onPressed: () async {
                      var data = await navigateToEntryForm(context, null);
                      if (data != null) {
                        int result = await dbhelper.insert(data);
                        if (result > 0) {
                          _updateHistory();
                          // _getInfo();
                        }
                      }
                    },
                    tooltip: "Tambah Data",
                    child: Icon(Icons.add),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return SizedBox();
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

 
  Future<Transaksi> navigateToEntryForm(
      BuildContext context, int index) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(index, _rebuilt);
    }));
    return result;
  }

  _createHistory() {
    return FutureBuilder(
      future: dbhelper.selectHistory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _data = snapshot.data;

          final _listData = List.generate(_data.length, (i) {
            return Transaksi(
              _data[i]['nominal'],
              _data[i]['jenistransaksi'],
              _data[i]['tanggaltransaksi'],
            );
          });

          return ListView.builder(
            itemCount: _listData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  title: Text(
                    _listData[index].jenistransaksi,
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Column(
                    children: [
                      Text('Nominal :  ${_listData[index].nominal} ',),
                      Text('Tanggal  :  ${_listData[index].tanggaltransaksi} '),
                    ],
                  ),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () async {
                          var transaksi = await navigateToEntryForm(
                            context,
                            index,
                          );
                          int result = await dbhelper.updateTransaksi(transaksi);
                          if (result >= 0) {
                            _updateHistory() ;
                          }
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () async {
                          int result = await dbhelper.deleteTransaksi(index);
                          if (result >= 0 || result > -1) {
                            _updateHistory() ;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return SizedBox();
        } else {
          return CircularProgressIndicator();
        }
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
