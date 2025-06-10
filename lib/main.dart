import 'package:flutter/material.dart';

void main() => runApp(InventoryApp());

class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(title: 'Barang', icon: Icons.inventory, count: 63),
    MenuItem(title: 'Dokumen', icon: Icons.book, count: 6),
    MenuItem(title: 'Laporan', icon: Icons.bar_chart),
    MenuItem(title: 'Biaya', icon: Icons.attach_money),
    MenuItem(title: 'Baru Masuk', icon: Icons.add_box),
    MenuItem(title: 'Baru Keluar', icon: Icons.indeterminate_check_box),
    MenuItem(title: 'Pindai kode barcode', icon: Icons.qr_code_scanner),
    MenuItem(title: 'Butuh bantuan?', icon: Icons.help_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang dan Persediaan'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.view_module), onPressed: () {})],
      ),
      drawer: Drawer(), // Tambahkan drawer jika diperlukan
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[900],
            padding: EdgeInsets.all(8),
            child: Text(
              'Toko Utama',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: menuItems.map((item) => MenuCard(item: item)).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: Icon(Icons.person), onPressed: () {}),
              IconButton(icon: Icon(Icons.attach_money), onPressed: () {}),
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              IconButton(icon: Icon(Icons.help), onPressed: () {}),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final int? count;

  MenuItem({required this.title, required this.icon, this.count});
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[400],
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {}, // Tambahkan aksi jika diperlukan
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 40, color: Colors.white),
              SizedBox(height: 8),
              Text(item.title, style: TextStyle(color: Colors.white)),
              if (item.count != null)
                Text(
                  item.count.toString(),
                  style: TextStyle(color: Colors.greenAccent),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
