import 'package:convert_me/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  late final SharedPreferences sharedPreferencesInstance;
  User? user;
  bool loggedIn = false;

  init() async {
    sharedPreferencesInstance = await SharedPreferences.getInstance();
    String? username = sharedPreferencesInstance.getString("username");
    String? from = sharedPreferencesInstance.getString("from");
    String? to = sharedPreferencesInstance.getString("to");
    if (username != null && from != null && to != null) {
      user = User(
        from: from,
        to: to,
        username: username,
      );
      loggedIn = true;
    }
  }

  Future<bool> signup(String username, String from, String to) async {
    loggedIn = await sharedPreferencesInstance.setString("username", username) &&
        await sharedPreferencesInstance.setString("from", from) &&
        await sharedPreferencesInstance.setString("to", to);
    return loggedIn;
  }

  Future<bool> update(User user) async {
    bool updated = await sharedPreferencesInstance.setString("username", user.username) &&
        await sharedPreferencesInstance.setString("from", user.from) &&
        await sharedPreferencesInstance.setString("to", user.to);
    user = user;
    return updated;
  }
}
