import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeatech/models/informasi.dart';
import 'package:zeatech/models/transaksi.dart';
import 'package:zeatech/helpers/dbhelper.dart';

class EntryForm extends StatefulWidget {
  final Transaksi transaksi;
  // final VoidCallback rebuilt;
  EntryForm(
    this.transaksi,
    // this.rebuilt,
  );

  @override
  EntryFormState createState() => EntryFormState(this.transaksi);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Transaksi transaksi;
  // int index;
  EntryFormState(this.transaksi);
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  var listType = ["Pemasukan", "Pengeluaran"];
  List<String> listViewType = List<String>();
  String valType = "Pemasukan";
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate.subtract(Duration(days: 30)),
        lastDate: DateTime(selectedDate.year + 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  // String valAcc = "tanggal";

  void dropdownOnChanged(String changeValue) {
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
          title: transaksi == null ? Text('Tambah Transaksi') : Text('Ubah'),
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
                    child: Text("Type",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
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
                      onChanged: dropdownOnChanged,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black54),
                  ),
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
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black54),
                  ),
                ),
              ),

              // tanggal
              // Container(
              //   margin: EdgeInsets.only(top: 15, left: 8),
              //   alignment: Alignment.topLeft,
              //   child: Text("tanggal transaksi",
              //       style: TextStyle(color: Colors.black, fontSize: 18)),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: <Widget>[
              //       Text("${selectedDate.toLocal()}".split(' ')[0]),
              //       SizedBox(
              //         height: 20.0,
              //       ),
              //       RaisedButton(
              //         onPressed: () => {
              //           _selectDate(context),
              //           print(selectedDate.day +
              //               selectedDate.month +
              //               selectedDate.year),
              //         },
              //         child: Text('Pilih Tanggal'),
              //       ),
              //     ],
              //   ),
              // ),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    textColor: Theme.of(context).accentColor,
                    onPressed: () => {
                      _selectDate(context),
                    },
                  ),
                ],
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
                          final _parsedJumlah =
                              int.parse(jumlahController.text);
                          final transaksi = Transaksi(
                            _parsedJumlah,
                            valType,
                            selectedDate.toString(),
                          );
                          DbHelper().insert(transaksi);
                          // widget.rebuilt();
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
