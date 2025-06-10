import 'package:flutter/material.dart';
import '../models/barang.dart';
import '../data/dummy_data.dart';
import 'tambah_barang_page.dart';

class DaftarBarangPage extends StatefulWidget {
  @override
  _DaftarBarangPageState createState() => _DaftarBarangPageState();
}

class _DaftarBarangPageState extends State<DaftarBarangPage> {
  List<Barang> barangList = List.from(
    dummyBarang,
  ); // Duplikasi agar bisa dimodifikasi

  void _navigateToTambahBarang() async {
    final Barang? barangBaru = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TambahBarangPage()),
    );

    if (barangBaru != null) {
      setState(() {
        barangList.add(barangBaru);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Barang')),
      body: ListView.builder(
        itemCount: barangList.length,
        itemBuilder: (context, index) {
          final item = barangList[index];
          return ListTile(
            title: Text(item.nama),
            subtitle: Text(
              'Kode: ${item.kode} | Qty: ${item.qty} | ${item.kategori}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToTambahBarang,
        child: Icon(Icons.add),
      ),
    );
  }
}
