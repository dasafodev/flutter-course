import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_preferences_shared.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  final prefs = new UserPreferences();



  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
          title: Text('User Preferences'),
          backgroundColor:
              (prefs.secondaryColor) ? Colors.teal : Colors.purple),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary Color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('Username: ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
}
