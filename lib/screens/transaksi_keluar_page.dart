import 'package:flutter/material.dart';
import '../models/transaksi.dart';
import 'tambah_transaksi_keluar_page.dart';

class TransaksiKeluarPage extends StatefulWidget {
  @override
  _TransaksiKeluarPageState createState() => _TransaksiKeluarPageState();
}

class _TransaksiKeluarPageState extends State<TransaksiKeluarPage> {
  List<Transaksi> transaksiKeluarList = [];

  void _tambahTransaksi() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TambahTransaksiKeluarPage()),
    );

    if (hasil != null && hasil is Transaksi) {
      setState(() {
        transaksiKeluarList.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaksi Keluar')),
      body:
          transaksiKeluarList.isEmpty
              ? Center(child: Text('Belum ada transaksi keluar.'))
              : ListView.builder(
                itemCount: transaksiKeluarList.length,
                itemBuilder: (context, index) {
                  final trx = transaksiKeluarList[index];
                  return ListTile(
                    leading: Icon(Icons.upload),
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
