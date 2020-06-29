import 'package:flutter/material.dart';
import 'package:qr_app/src/models/scan_model.dart';
import 'package:qr_app/src/providers/db_provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getAllScans(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final scans = snapshot.data;
        if (scans.length == 0) {
          return Center(
            child: Text('No hay registros'),
          );
        }
        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) => DBProvider.db.deleteScan(scans[index].id) ,
                  child: ListTile(
                    leading: Icon(Icons.cloud_queue,
                        color: Theme.of(context).primaryColor),
                    title: Text(scans[index].valor),
                    subtitle: Text('${scans[index].id}'),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                ));
      },
    );
  }
}
