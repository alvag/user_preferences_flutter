import 'package:flutter/material.dart';
import 'package:user_preferences_flutter/src/shared_preferences/user_preferences.dart';
import 'package:user_preferences_flutter/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.secondaryColor}'),
          Divider(),
          Text('Género: ${prefs.gender == 1 ? "Masculino" : "Femenino"}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.name}'),
          Divider()
        ],
      ),
    );
  }
}
