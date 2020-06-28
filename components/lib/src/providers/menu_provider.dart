import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {
  List<dynamic> options =[];

  _MenuProvider(){
    // loadData();
  }

  //  void  loadData () {
  //   rootBundle.loadString('data/menu_opts.json')
  //   .then((data){
  //     Map dataMap = json.decode(data);
  //   print(dataMap);
  //   });
  // }
   Future<List<dynamic>> loadData () async {
    String data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = new _MenuProvider();