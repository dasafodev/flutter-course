import 'dart:async';

import 'package:qr_app/src/bloc/validator.dart';
import 'package:qr_app/src/models/scan_model.dart';
import 'package:qr_app/src/providers/db_provider.dart';

class ScansBloc with Validator{
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    getAllScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validateHttp);

  dispose() {
    _scansController?.close();
  }

  addScan(ScanModel scan) async {
    await DBProvider.db.newScan(scan);
    getAllScans();
  }

  getAllScans() async {
    _scansController.sink.add(await DBProvider.db.getAllScans());
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getAllScans();
  }

  deleteAllScans() async {
    DBProvider.db.deleteAll();
    getAllScans();
  }
}
