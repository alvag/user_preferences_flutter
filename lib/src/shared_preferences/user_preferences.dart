import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences_flutter/src/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._();

  UserPreferences._();

  factory UserPreferences() {
    return _instance;
  }

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
