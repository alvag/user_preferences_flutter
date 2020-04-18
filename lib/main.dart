import 'package:flutter/material.dart';
import 'package:user_preferences_flutter/src/pages/home_page.dart';
import 'package:user_preferences_flutter/src/pages/settings_page.dart';
import 'package:user_preferences_flutter/src/shared_preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: _prefs.lastPage,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage()
      },
    );
  }
}
