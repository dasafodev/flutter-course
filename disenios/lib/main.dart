import 'package:disenios/src/pages/basic_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'basic',
      routes: {
        'basic'   : (BuildContext context) => BasicoPage(),
      },
      
    );
  }

}