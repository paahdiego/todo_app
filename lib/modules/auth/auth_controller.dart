import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app_routes.dart';
import 'package:todo_app/repositories/auth/auth_repository.dart';
import 'package:todo_app/models/user_model.dart';

class AuthController {
  static Future<void> isAuthenticated(BuildContext context) async {
    final isAuthenticated = await AuthRepository.isAuthenticated();

    if (isAuthenticated) {
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.login);
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
