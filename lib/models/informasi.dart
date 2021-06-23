class Informasi {
  int _id;
  int _pemasukan;
  int _pengeluaran;

  int get id => _id;

  get pemasukan => this._pemasukan;
  set pemasukan(value) => this._pemasukan = value;

  get pengeluaran => this._pengeluaran;
  set pengeluaran(value) => this._pengeluaran = value;

  // Konstruktor versi 1
  Informasi(this._pemasukan, this._pengeluaran);

  // Konstruktor versi 2
  Informasi.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._pemasukan = map['pemasukan'];
    this._pengeluaran = map['pengeluaran'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['pemasukan'] = pemasukan;
    map['pengeluaran'] = pengeluaran;
    return map;
  }
}
