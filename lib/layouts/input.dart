import 'package:flutter/material.dart';
import 'package:zeatech/models/informasi.dart';
import 'package:zeatech/models/transaksi.dart';
import 'package:zeatech/helpers/dbhelper.dart';

class EntryForm extends StatefulWidget {
  final int index;
  final VoidCallback rebuilt;

  EntryForm(
    this.index,
    this.rebuilt,
  );

  @override
  EntryFormState createState() => EntryFormState(this.index);
}

//class controller
class EntryFormState extends State<EntryForm> {
  int index;
  EntryFormState(this.index);
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  var listType = ["Pemasukan", "Pengeluaran"];
  List<String> listViewType = List<String>();
  String valType = "Pemasukan";
  String valAcc = "tanggal";
  int nominal;

  void dropdownOnChangedt(String changeValue) {
    setState(() {
      valType = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    //kondisi
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: index == null ? Text('Tambah Transaksi') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 8),
                    child: Text("Type",style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 150,
                      top: 20,
                    ),
                    child: DropdownButton<String>(
                      items: listType.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: valType,
                      onChanged: dropdownOnChangedt,
                    ),
                  ),
                ],
              ),

              // tanggal
              Container(
                margin: EdgeInsets.only(top: 15, left: 8),
                alignment: Alignment.topLeft,
                child: Text("tanggal transaksi",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: tanggalController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'tanggal transaksi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),

              // nominal
              Container(
                margin: EdgeInsets.only(top: 15, left: 8),
                alignment: Alignment.topLeft,
                child: Text("Nominal",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Nominal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () async {
                          // if (item == null) {
                          // tambah data
                          final _parsedJumlah =
                              int.parse(jumlahController.text);
                          final item = Item(
                            valType,
                            valAcc,
                            tanggalController.text,
                            _parsedJumlah,
                            
                          );
                          final transaction = Transaksi(
                            (valType == 'Pemasukan') ? _parsedJumlah : 0,
                            (valType == 'Pengeluaran') ? _parsedJumlah : 0,
                            (valAcc == 'tanggal') ? _parsedJumlah : 0,
                            (valAcc == '') ? _parsedJumlah : 0,
                            _parsedJumlah,
                            
                          );

                          DbHelper().insert(item);
                          

                          widget.rebuilt();

                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}