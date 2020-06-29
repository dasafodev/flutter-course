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
    final res = db.insert('Scans', newScan.toJson());
    return res;
  }


}
