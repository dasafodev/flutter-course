import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:qr_app/src/models/scan_model.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Coordenadas'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.my_location), onPressed: () {})
        ],
      ),
      body:_createFlutterMap(scan),
    );
  }

  Widget  _createFlutterMap(ScanModel scan) {

    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 10
      ),
      layers: [
        _createMap(),
        _createMarks(scan)
      ],
      );
  }

  LayerOptions _createMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/styles/v1/'
        '{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
        'accessToken':'pk.eyJ1IjoiZGFzYWZvZGV2IiwiYSI6ImNrYzEzc3p6czE3cXYzNXBqYzk1YXZwb3EifQ.OIlLd5XJOghWLf0REF1DQA',
        'id': 'mapbox/streets-v11'
        }
    );
  }

   _createMarks(ScanModel scan) {
     return MarkerLayerOptions(
       markers: [
         Marker(
           width: 100.0,
           height: 100.0,
           point: scan.getLatLng(),
           builder: (context) => Container(child:Icon(Icons.location_on,size: 45.0,color: Theme.of(context).primaryColor,))
         )
       ]
     );

  }
}

// return TileLayerOptions(
//         urlTemplate: 'https://api.tiles.mapbox.com/v4/'
//             '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
//         additionalOptions: {
//         'accessToken':'pk.eyJ1Ijoiam9yZ2VncmVnb3J5IiwiYSI6ImNrODk5aXE5cjA0c2wzZ3BjcTA0NGs3YjcifQ.H9LcQyP_-G9sxhaT5YbVow',
//         'id': 'mapbox.streets'
//         }
// );