import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String _isComp = 'isComp';

  SharedPreferences? prefs;
  static Future<void> setCompany({required bool value}) async {
    final SharedPreferences _sPref = await SharedPreferences.getInstance();
    await _sPref.setBool(_isComp, value);
  }

  static Future<bool> get getCompany async {
    final SharedPreferences _sPref = await SharedPreferences.getInstance();
    final bool? _comp = _sPref.getBool(_isComp);
    return _comp ?? false;
  }
}
