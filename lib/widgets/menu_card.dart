import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final int? count;

  MenuItem({required this.title, required this.icon, this.count});
}

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;

  const MenuCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[400],
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
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
