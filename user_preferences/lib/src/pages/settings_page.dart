import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_preferences_shared.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor ;
  int _gender;
  String _name ;

  TextEditingController _textEditingController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.name;
    prefs.lastPage = SettingsPage.routeName;
    _textEditingController = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings'),backgroundColor: (prefs.secondaryColor)? Colors.teal:Colors.purple),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              onChanged: (val) {
                setState(() {
                  _secondaryColor = val;
                  prefs.secondaryColor = val;
                });
              },
              title: Text('Color Secundario'),
            ),
            RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _gender,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                title: Text('Femenino'),
                value: 2,
                groupValue: _gender,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del propietario del telefono'),
                onChanged: (value) {
                  prefs.name = value;
                },
              ),
            ),
          ],
        ));
  }

  _setSelectedRadio(int val) {
    setState(() {
      prefs.gender = val;
      _gender = val;
    });
  }
}
