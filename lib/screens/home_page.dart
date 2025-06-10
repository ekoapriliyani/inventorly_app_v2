import 'package:flutter/material.dart';
import 'daftar_barang_page.dart';
import 'transaksi_masuk_page.dart';
import 'transaksi_keluar_page.dart';

class HomePage extends StatelessWidget {
  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMenuItem(
              context: context,
              icon: Icons.inventory_2,
              title: 'Data Barang',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DaftarBarangPage()),
                );
              },
            ),
            SizedBox(height: 12),
            _buildMenuItem(
              context: context,
              icon: Icons.download,
              title: 'Transaksi Masuk',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TransaksiMasukPage()),
                );
              },
            ),
            SizedBox(height: 12),
            _buildMenuItem(
              context: context,
              icon: Icons.upload,
              title: 'Transaksi Keluar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TransaksiKeluarPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
