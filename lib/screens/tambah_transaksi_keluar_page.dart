import 'package:flutter/material.dart';
import '../models/transaksi.dart';

class TambahTransaksiKeluarPage extends StatefulWidget {
  @override
  _TambahTransaksiKeluarPageState createState() =>
      _TambahTransaksiKeluarPageState();
}

class _TambahTransaksiKeluarPageState extends State<TambahTransaksiKeluarPage> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _qtyController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final transaksi = Transaksi(
        kodeBarang: _kodeController.text.trim(),
        qty: int.parse(_qtyController.text.trim()),
        tanggal: DateTime.now(),
      );

      Navigator.pop(context, transaksi);
    }
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Transaksi Keluar')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: InputDecoration(labelText: 'Kode Barang'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _qtyController,
                decoration: InputDecoration(labelText: 'Qty Keluar'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Wajib diisi';
                  if (int.tryParse(value) == null) return 'Harus angka';
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(onPressed: _submitForm, child: Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}
