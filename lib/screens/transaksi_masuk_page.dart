import 'package:flutter/material.dart';
import '../models/transaksi.dart';
import 'tambah_transaksi_masuk_page.dart';

class TransaksiMasukPage extends StatefulWidget {
  @override
  _TransaksiMasukPageState createState() => _TransaksiMasukPageState();
}

class _TransaksiMasukPageState extends State<TransaksiMasukPage> {
  List<Transaksi> transaksiMasukList = [];

  void _tambahTransaksi() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TambahTransaksiMasukPage()),
    );

    if (hasil != null && hasil is Transaksi) {
      setState(() {
        transaksiMasukList.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaksi Masuk')),
      body:
          transaksiMasukList.isEmpty
              ? Center(child: Text('Belum ada transaksi masuk.'))
              : ListView.builder(
                itemCount: transaksiMasukList.length,
                itemBuilder: (context, index) {
                  final trx = transaksiMasukList[index];
                  return ListTile(
                    leading: Icon(Icons.download),
                    title: Text('Kode: ${trx.kodeBarang}'),
                    subtitle: Text(
                      'Qty: ${trx.qty} | Tanggal: ${trx.tanggal.toLocal().toString().split(" ")[0]}',
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahTransaksi,
        child: Icon(Icons.add),
      ),
    );
  }
}
