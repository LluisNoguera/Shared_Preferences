import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nom = '';
  static String _userName = "";
  static String _password = "";
  static bool _isDarkMode = false;
  static List<String> _color = ['0', '50', '50', '50'];
  static int _genere = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nom {
    return _prefs.getString('nom') ?? _nom;
  }

  static set nom(String value) {
    _nom = value;
    _prefs.setString('nom', value);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get genere {
    return _prefs.getInt('genere') ?? _genere;
  }

  static set genere(int value) {
    _genere = value;
    _prefs.setInt('genere', value);
  }

  static String get userName {
    return _prefs.getString('userName') ?? _userName;
  }

  static set userName(String value) {
    _userName = value;
    _prefs.setString('userName', value);
  }

  static String get password {
    return _prefs.getString('password') ?? _password;
  }

  static set password(String value) {
    _password = value;
    _prefs.setString('password', value);
  }

  static List<int> get color {
    List<String> prov = _prefs.getStringList('color') ?? _color;
    return [
      int.parse(prov[0]),
      int.parse(prov[1]),
      int.parse(prov[2]),
      int.parse(prov[3])
    ];
  }

  static set color(List<int> value) {
    _color = [
      value[0].toString(),
      value[1].toString(),
      value[2].toString(),
      value[3].toString()
    ];
    _prefs.setStringList('color', [
      value[0].toString(),
      value[1].toString(),
      value[2].toString(),
      value[3].toString()
    ]);
  }
}
