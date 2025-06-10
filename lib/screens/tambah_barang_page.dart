import 'package:flutter/material.dart';
import '../models/barang.dart';

class TambahBarangPage extends StatefulWidget {
  @override
  _TambahBarangPageState createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _qtyController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final barang = Barang(
        kode: _kodeController.text.trim(),
        nama: _namaController.text.trim(),
        qty: int.parse(_qtyController.text.trim()),
      );
      Navigator.pop(context, barang);
    }
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Barang')),
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
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Barang'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _qtyController,
                decoration: InputDecoration(labelText: 'Qty'),
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
