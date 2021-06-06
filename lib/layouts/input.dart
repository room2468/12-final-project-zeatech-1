import 'package:flutter/material.dart';

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
  TextEditingController typeController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  var listType = ["Pemasukan", "Pengeluaran"];
  List<String> listViewType = List<String>();
  String valType = "Pemasukan";
  var account = ["cash", "bank"];
  String valAcc = "cash";
  int inputjumlah;
  String tipe;

  void dropdownOnChangedt(String changeValue) {
    setState(() {
      valType = changeValue;
    });
  }

  void dropdownOnChangeda(String changeValue) {
    setState(() {
      valAcc = changeValue;
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
                      onChanged: dropdownOnChangedt,
                    ),
                  ),
                ],
              ),

              // account
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 8),
                    child: Text("Account",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 130,
                      top: 10,
                    ),
                    child: DropdownButton<String>(
                      items: account.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: valAcc,
                      onChanged: dropdownOnChangeda,
                    ),
                  ),
                ],
              ),

              // keterangan
              Container(
                margin: EdgeInsets.only(top: 15, left: 8),
                alignment: Alignment.topLeft,
                child: Text("keterangan",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: keteranganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'keterangan',
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
            ],
          ),
        ));
  }
}
