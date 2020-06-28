import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
      
    );
  }

  Widget _list() {

    return FutureBuilder(
      builder: (BuildContext context,
        AsyncSnapshot<List<dynamic>> snapshot)
        => ListView(children: _listItems(snapshot.data,context)),
      future: menuProvider.loadData(),
      initialData: [], //Opcional
      );
    // menuProvider.loadData().then((value) => print(value));
    // 
  }

  List<Widget>_listItems(List<dynamic> data, BuildContext context) {
    
      final List<Widget> options = [];

      data.forEach((item) {
        final widgetTemp = ListTile(
          title: Text(item['texto']),
          leading:getIcon(item['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap:() {

            Navigator.pushNamed(context, item['ruta']);
            // final route = MaterialPageRoute(
            //   builder: (context)=> AlertPage());
            // Navigator.push(context, route);
          },
        );
        options..add(widgetTemp)
               ..add(Divider());
      });
      return options;
  }
}