class Transaksi {
  int _id;
  int _nominal;
  int _pemasukan;
  int _pengeluaran;
  String _tanggaltransaksi;

  int get id => _id;

  get nominal => this._nominal;
  set nominal(value) => this._nominal = value;

  get pemasukan => this._pemasukan;
  set pemasukan(value) => this._pemasukan = value;

  get pengeluaran => this._pengeluaran;
  set pengeluaran(value) => this._pengeluaran = value;

  String get tanggaltransaksi => this._tanggaltransaksi;
  set tanggaltransaksi(String value) => this._tanggaltransaksi = value;

  Transaksi(this._nominal,this._pemasukan , this._pengeluaran, this._tanggaltransaksi);
  Transaksi.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nominal = map['nominal'];
    this._pemasukan = map['pemasukan'];
    this._pengeluaran = map['pengeluaran'];
    this._tanggaltransaksi = map['tanggaltransaksi'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nominal'] = nominal;
    map['pemasukan'] = pemasukan;
    map['pengeluaran'] = pengeluaran;
    map['tanggaltransaksi'] = tanggaltransaksi;
    return map;
  }
}