import 'package:flutter/material.dart';
import '../models/barang.dart';
import '../helpers/db_helper.dart';

class DaftarBarangPage extends StatelessWidget {
  const DaftarBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Barang')),
      body: FutureBuilder<List<Barang>>(
        future: DBHelper.getAllBarang(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada barang'));
          } else {
            final barangList = snapshot.data!;
            return ListView.builder(
              itemCount: barangList.length,
              itemBuilder: (context, index) {
                final item = barangList[index];
                return ListTile(
                  title: Text(item.nama),
                  subtitle: Text('Kode: ${item.kode} | Qty: ${item.qty}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/tambah-barang');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
