import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/theme/theme_model.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instance(
    BuildContext context, {
    bool listen = false,
  }) =>
      Provider.of<ThemeController>(context, listen: listen);

  final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);
  ThemeMode get themeMode => themeModeNotifier.value;

  ThemeController() {
    setUserTheme();
  }

  void setUserTheme() async {
    final themeModel = await getUserTheme();

    if (themeModel != null) {
      if (themeModel.themeMode == 'dark') {
        themeModeNotifier.value = ThemeMode.dark;
      } else if (themeModel.themeMode == 'light') {
        themeModeNotifier.value = ThemeMode.light;
      }
    }

    notifyListeners();
  }

  void changeTheme(BuildContext context) {
    if (themeMode == ThemeMode.system) {
      final mediaQueryData = MediaQuery.of(context);

      if (mediaQueryData.platformBrightness == Brightness.dark) {
        themeModeNotifier.value = ThemeMode.light;
        saveUserTheme(ThemeModel(themeMode: 'light'));
      } else {
        themeModeNotifier.value = ThemeMode.dark;
        saveUserTheme(ThemeModel(themeMode: 'dark'));
      }
    } else if (themeMode == ThemeMode.dark) {
      themeModeNotifier.value = ThemeMode.light;
      saveUserTheme(ThemeModel(themeMode: 'light'));
    } else {
      themeModeNotifier.value = ThemeMode.dark;
      saveUserTheme(ThemeModel(themeMode: 'dark'));
    }

    notifyListeners();
  }

  bool isDarkModeTurnedOn(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.system:
        final brightness = MediaQuery.of(context).platformBrightness;
        if (brightness == Brightness.dark) {
          return false;
        } else {
          return true;
        }
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
    }
  }

  Future<void> saveUserTheme(ThemeModel theme) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setString("theme", theme.toJson());
  }

  Future<ThemeModel?> getUserTheme() async {
    final instance = await SharedPreferences.getInstance();

    final theme = instance.getString('theme');

    if (theme != null) return ThemeModel.fromJson(theme);

    return null;
  }

  Future<void> removeUserTheme() async {
    final instance = await SharedPreferences.getInstance();

    await instance.remove('theme');
  }
}
