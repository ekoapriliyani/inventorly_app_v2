import 'package:flutter/material.dart';
import 'screens/home_page.dart';

import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // ✅ perbaiki ini

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi untuk desktop (Windows/Linux/Mac)
  if (!kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
