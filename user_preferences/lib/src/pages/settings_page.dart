import 'package:flutter/material.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Pedro';

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
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
                });
              },
              title: Text('Color Secundario'),
            ),
            RadioListTile(
                title: Text('Masculino'),
                value: 1,
                groupValue: _gender,
                onChanged: (val) {
                  setState(() {
                    _gender = val;
                  });
                }),
            RadioListTile(
                title: Text('Femenino'),
                value: 2,
                groupValue: _gender,
                onChanged: (val) {
                  setState(() {
                    _gender = val;
                  });
                }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del propietario del telefono'),
                onChanged: (value) {},
              ),
            ),
          ],
        ));
  }
}
