import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/auth/auth_controller.dart';
import 'package:todo_app/modules/splash/splash_page.dart';

import 'package:todo_app/models/user_model.dart';

class AppController extends ChangeNotifier {
  void _clearUser() {
    loggedUser = null;
  }

  Future<void> logout() async {
    _clearUser();
    await AuthController.deauthenticate();
    Modular.to.pushReplacementNamed(SplashPage.routeName);
  }

  static AppController instance(BuildContext context, {bool listen = false}) =>
      Provider.of<AppController>(
        context,
        listen: listen,
      );

  UserModel? loggedUser;
}
