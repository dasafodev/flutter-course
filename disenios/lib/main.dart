import 'package:flutter/material.dart';

import 'package:disenios/src/pages/scroll_page.dart';
import 'package:disenios/src/pages/basic_page.dart';
import 'package:flutter/services.dart';
import 'src/pages/medium_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white)) ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'medium',
      routes: {
        'basic'   : (BuildContext context) => BasicoPage(),
        'scroll'   : (BuildContext context) => ScrollPage(),
        'medium'   : (BuildContext context) => MediumPage(),
      },
      
    );
  }

}