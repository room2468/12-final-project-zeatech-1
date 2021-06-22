class Item {
  int _id;
  String _type;
  String _account;
  String _keterangan;
  int _jumlah;
  

  int get id => _id;

  String get type => this._type;
  set type(String value) => this._type = value;

  String get account => this._account;
  set account(String value) => this._account = value;

  String get keterangan => this._keterangan;
  set keterangan(String value) => this._keterangan = value;

  get jumlah => this._jumlah;
  set jumlah(value) => this._jumlah = value;



  // konstruktor versi 1
  Item(this._type, this._account, this._keterangan, this._jumlah);
  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._account = map['account'];
    this._keterangan = map['keterangan'];
    this._jumlah = map['jumlah'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['type'] = type;
    map['account'] = account;
    map['keterangan'] = keterangan;
    map['jumlah'] = jumlah;
    return map;
  }
}
