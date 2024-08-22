import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesServices {

  getselectedlanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("Selected_language_index") ?? 0;
  }

  setSelectedLanguage(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Selected_language_index", index);
  }

  static setBearerToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("bearerToken", token);
  }

  static Future<String> getBearerToken() async {
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("bearerToken") ?? "";
    return token;
  }

  static Future<void> setIsIntroVisible(bool isIntroVisible) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isIntroVisible", isIntroVisible);
  }

  static Future<bool> checkIsIntroVisible() async {
    bool isIntroVisible;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isIntroVisible = sharedPreferences.getBool("isIntroVisible") ?? false;
    return isIntroVisible;
  }
}
