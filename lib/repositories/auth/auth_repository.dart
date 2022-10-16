import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/shared/utils/shared_preferences_keys.dart';

class AuthRepository {
  static Future<bool> isAuthenticated() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(SharedPreferencesKeys.loggedUser);
  }

  static Future<void> saveLoggedUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(SharedPreferencesKeys.loggedUser, user.toJson());
  }

  static Future<void> clearLoggedUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(SharedPreferencesKeys.loggedUser);
  }

  static Future<UserModel?> getLoggedUser() async {
    final instance = await SharedPreferences.getInstance();
    final String? userJson = instance.getString(
      SharedPreferencesKeys.loggedUser,
    );

    if (userJson == null) {
      return null;
    }

    return UserModel.fromJson(userJson);
  }
}
