import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qr_app/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    return (_database != null) ? _database : _database = await initDB();
  }

  initDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    final path = join(docDirectory.path, 'ScansDB.db');
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
            'CREATE TABLE Scans('
            'id INTEGER PRIMARY KEY,'
            'tipo TEXT,'
            'valor TEXT'
            ')'
            );
        });
  }


  newScanRaw(ScanModel newScan)async{
    final db = await database ;
    final res = await db.rawInsert(
      "INSERT Into Scans (id,tipo,valor) "
      "VALUES ( ${newScan.id}, '${newScan.tipo}', '${newScan.valor}')"
    );
    return res;
  }

  newScan(ScanModel newScan)async{
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?',whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first):null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty ? res.map((scan) => ScanModel.fromJson(scan)).toList():[];

    return list;
  }

  Future<List<ScanModel>> getByType(int type) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo ='$type'");

    List<ScanModel> list = res.isNotEmpty ? res.map((scan) => ScanModel.fromJson(scan)).toList():[];

    return list;
  }

  Future<int> updateScan(ScanModel newScan)async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(), where: 'id = ?',whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async{
    final db = await database;
    final res = await db.delete('Scans',where: 'id = ?',whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll( ) async{
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }





}
