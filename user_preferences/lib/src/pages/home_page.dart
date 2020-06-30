import 'package:flutter/material.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Preferences')),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary Color'),
          Divider(),
          Text('Gender'),
          Divider(),
          Text('Usernam'),
          Divider(),
        ],
      ),
    );
  }
}
