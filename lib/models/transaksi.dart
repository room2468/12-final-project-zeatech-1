class Transaksi {
  int _id;
  int _nominal;
  String _jenistransaksi;
  String _tanggaltransaksi;

  int get id => _id;

  get nominal => this._nominal;
  set nominal(value) => this._nominal = value;

  get pemasukan => this._jenistransaksi;
  set pemasukan(value) => this._jenistransaksi = value;

  String get tanggaltransaksi => this._tanggaltransaksi;
  set tanggaltransaksi(String value) => this._tanggaltransaksi = value;

  Transaksi(this._nominal, this._jenistransaksi, this._tanggaltransaksi);
  Transaksi.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nominal = map['nominal'];
    this._jenistransaksi = map['jenistransaksi'];
    this._tanggaltransaksi = map['tanggaltransaksi'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nominal'] = nominal;
    map['pemasukan'] = pemasukan;
    map['tanggaltransaksi'] = tanggaltransaksi;
    return map;
  }
}
