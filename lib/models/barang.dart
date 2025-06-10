class Barang {
  final int? id;
  final String kode;
  final String nama;
  final int qty;

  Barang({this.id, required this.kode, required this.nama, required this.qty});

  Map<String, dynamic> toMap() {
    return {'id': id, 'kode': kode, 'nama': nama, 'qty': qty};
  }

  factory Barang.fromMap(Map<String, dynamic> map) {
    return Barang(
      id: map['id'],
      kode: map['kode'],
      nama: map['nama'],
      qty: map['qty'],
    );
  }
}
