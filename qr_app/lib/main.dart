import 'package:flutter/material.dart';
import 'package:qr_app/src/pages/home_page.dart';

// import 'src/pages/directions_page.dart';
// import 'src/pages/maps_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        // 'directions'    : (BuildContext context) => DirectionsPage(),
        // 'maps'    : (BuildContext context) => MapsPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}