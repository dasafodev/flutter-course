import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_app/src/bloc/scans_bloc.dart';
import 'package:qr_app/src/models/scan_model.dart';

import 'package:qr_app/src/pages/directions_page.dart';
import 'package:qr_app/src/utils/utils.dart' as utils;
import 'maps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.deleteAllScans,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed:() => _scanQR(context),
      ),
    );
  }

  _scanQR(BuildContext context) async {
    //https://fernando-herrera.com
    //geo:40.73255860802501,-73.89333143671877
    dynamic futureString = 'https://fernando-herrera.com';
    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      final scan2 =
          ScanModel(valor: 'geo:40.73255860802501,-73.89333143671877');
      scansBloc.addScan(scan);
      scansBloc.addScan(scan2);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.launchScan(context,scan);
        });
      } else {
        utils.launchScan(context,scan);
      }
    }
    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }
    // print('Future String: ${futureString.rawContent}');
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
        ]);
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();

      default:
        return MapsPage();
    }
  }
}
