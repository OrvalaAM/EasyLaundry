import 'dart:io';
import 'package:mvp/models/pesanan_model.dart';
import 'package:mvp/models/pewangi_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = 'db_laundry.db';
  final int _databaseVersion = 1;

  Database? _database;
  String tabelPesanan =
      'CREATE TABLE pesanan (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, no_hp TEXT, alamat TEXT NULL, jenis_layanan TEXT, nama_layanan TEXT, kuantitas REAL, harga INTEGER, estimasi INTEGER, created_at TEXT, updated_at TEXT)';

  String tabelPewangi =
      'CREATE TABLE pewangi (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, foto TEXT, created_at TEXT, updated_at TEXT)';
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print('bikin tabel pewangi');
    await db.execute(tabelPesanan);
    await db.execute(tabelPewangi);
  }

  Future<List<PewangiModel>> getAllPewangi() async {
    final data = await _database!.query('pewangi');
    List<PewangiModel> result =
        data.map((e) => PewangiModel.fromJson(e)).toList();
    return result;
  }

  Future<List<PesananModel>> getAllPesanan() async {
    final data = await _database!.query('pesanan');
    List<PesananModel> result =
        data.map((e) => PesananModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insertPesanan(Map<String, dynamic> row) async {
    final query = await _database!.insert('pesanan', row);
    return query;
  }
}
