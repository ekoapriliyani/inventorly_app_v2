import 'package:flutter/material.dart';
import 'screens/home_page.dart';

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
