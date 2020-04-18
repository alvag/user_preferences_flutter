import 'package:flutter/material.dart';
import 'package:user_preferences_flutter/src/shared_preferences/user_preferences.dart';

import 'package:user_preferences_flutter/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _prefs = new UserPreferences();
  bool _secondaryColor = false;
  int _gender;
  TextEditingController _textCtrl;

  @override
  void initState() {
    super.initState();

    _prefs.lastPage = SettingsPage.routeName;
    _textCtrl = new TextEditingController(text: _prefs.name);
    _gender = _prefs.gender;
    _secondaryColor = _prefs.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: _secondaryColor ? Colors.teal : Colors.blue,
      ),
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
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _secondaryColor = value;
                _prefs.secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _gender,
            title: Text('Masculino'),
            onChanged: _setGender,
          ),
          RadioListTile(
            value: 2,
            groupValue: _gender,
            title: Text('Femenino'),
            onChanged: _setGender,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textCtrl,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del propietario del teléfono',
              ),
              onChanged: (value) {
                setState(() {
                  _prefs.name = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _setGender(int value) {
    _prefs.gender = value;

    setState(() {
      _gender = value;
    });
  }
}
