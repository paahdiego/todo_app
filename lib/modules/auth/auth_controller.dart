import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todo_app/modules/auth/login/login_page.dart';
import 'package:todo_app/modules/home/home_page.dart';
import 'package:todo_app/repositories/auth/auth_repository.dart';
import 'package:todo_app/models/user_model.dart';

class AuthController {
  static Future<void> isAuthenticated(BuildContext context) async {
    final isAuthenticated = await AuthRepository.isAuthenticated();

    if (isAuthenticated) {
      Modular.to.pushReplacementNamed(HomePage.routeName);
    } else {
      Modular.to.pushReplacementNamed(LoginPage.routeName);
    }
  }

  static Future<void> authenticate({required UserModel user}) async {
    await AuthRepository.saveLoggedUser(user);
  }

  static Future<UserModel?> getLoggedUser() async {
    final loggedUser = await AuthRepository.getLoggedUser();
    return loggedUser;
  }

  static Future<void> deauthenticate() async {
    await AuthRepository.clearLoggedUser();
  }
}
