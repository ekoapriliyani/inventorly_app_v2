import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/barang.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'inventory.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE barang(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            kode TEXT,
            nama TEXT,
            qty INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE transaksi(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            kodeBarang TEXT,
            qty INTEGER,
            tanggal TEXT,
            jenis TEXT
          )
        ''');
      },
    );
  }

  // 👇 Pastikan ini ada dalam class DBHelper juga
  static Future<int> insertBarang(Barang barang) async {
    final db = await database;
    return await db.insert('barang', barang.toMap());
  }

  static Future<List<Barang>> getAllBarang() async {
    final db = await database;
    final data = await db.query('barang', orderBy: 'nama');
    return data.map((map) => Barang.fromMap(map)).toList();
  }
}
