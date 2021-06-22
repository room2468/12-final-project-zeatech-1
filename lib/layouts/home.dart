import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Money Manager"),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                width: 350.0,
                height: 100.0,
                margin: EdgeInsets.fromLTRB(4, 20, 4, 0),
                padding: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.0, 20.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                          child: Text("Pemasukan",
                              style: TextStyle(color: Colors.blue, fontSize: 15)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Rp. 0",
                              style: TextStyle(color: Colors.blue, fontSize: 20)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 20, 0, 0),
                          child: Text("Pengeluaran",
                              style: TextStyle(color: Colors.red, fontSize: 15)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Rp. 0",
                              style: TextStyle(color: Colors.red, fontSize: 20)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 30,
                      ),
                      child: Text("Saldo",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 180, top: 30, right: 5),
                      child: Text("Rp. 0",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0XFFE0E0E0)),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 20,
                      ),
                      child: Text("Cash",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 180, top: 20, right: 5),
                      child: Text(" Rp. 0",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0XFFE0E0E0)),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 20,
                      ),
                      child: Text("Bank",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 180, top: 20, right: 5),
                      child: Text(" Rp. 0",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0XFFE0E0E0)),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Transaksi Terakhir",
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
              Flexible(
                child: (Container(
                  padding: EdgeInsets.fromLTRB(8, 160, 8, 8),
                  width: 350.0,
                  height: 220.0,
                  child: RaisedButton(
                    onPressed: null,
                    color: Colors.blue[400],
                    textColor: Colors.white,
                    child: Text(
                      "Tambah Tranksaksi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
