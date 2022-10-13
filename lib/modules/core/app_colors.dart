import 'package:flutter/material.dart';

import 'package:todo_app/modules/theme/theme.dart';

class AppColors {
  static const Color primary = Color(0xFF109310);
  static const Color secondary = Color(0xFF72B01D);
  //Light Theme
  static const Color backgroundColorLight = white;
  static const Color subBackgroundColorLight = Color(0xFFD5D5D5);
  static const Color fontColorLight = Color(0xFF222222);
  static const Color drawerBackgroundColorLight = Color(0xFFb8b8b8);
  //Dark Theme
  static const Color backgroundColorDark = black;
  static const Color subBackgroundColorDark = Color(0xFF212224);
  static const Color fontColorDark = white;
  static const Color drawerBackgroundColorDark = Color(0xFF141414);

  static const Color white = Color(0xFFfaf9f9);
  static const Color black = Color(0xFF0B090A);
  static const Color transparent = Colors.transparent;

  static const Color warning = Color(0xFFF2C14E);
  static const Color error = Color(0xFFf78e31);

  static const backgroundGradientDark = LinearGradient(
    stops: [0.8, 1.0],
    colors: [
      backgroundColorDark,
      subBackgroundColorDark,
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const backgroundGradientLight = LinearGradient(
    stops: [0.8, 1.0],
    colors: [
      backgroundColorLight,
      subBackgroundColorLight,
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient backgroundGradient(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) {
      return backgroundGradientDark;
    } else {
      return backgroundGradientLight;
    }
  }

  static Color drawerBackgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) {
      return drawerBackgroundColorDark;
    }
    return drawerBackgroundColorLight;
  }

  static Color blackOrWhite(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return white;
    return black;
  }

  static Color backgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return backgroundColorDark;
    return backgroundColorLight;
  }

  static Color subBackgroundColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) {
      return subBackgroundColorDark;
    }
    return subBackgroundColorLight;
  }

  static Color fontColor(BuildContext context) {
    final themeController = ThemeController.instance(context);

    if (themeController.isDarkModeTurnedOn(context)) return fontColorDark;
    return fontColorLight;
  }

  static Color foregroundColorBasedOnBackground(Color reference) {
    if (reference.computeLuminance() > 0.5) return fontColorDark;
    return Colors.white;
  }
}
