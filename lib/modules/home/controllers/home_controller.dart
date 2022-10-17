import 'package:flutter/material.dart';
import 'package:todo_app/app_controller.dart';

import 'package:todo_app/modules/auth/auth_controller.dart';
import 'package:todo_app/modules/home/home_state.dart';
import 'package:todo_app/shared/utils/app_notifications.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeStateEmpty());

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  HomeController(BuildContext context) {
    setAppController(context);
  }

  void setAppController(BuildContext context) async {
    state = HomeStateLoading();

    final appController = AppController.instance(context);

    final loggedUser = await AuthController.getLoggedUser();

    appController.loggedUser = loggedUser;

    if (loggedUser != null) {
      AppNotifications.simpleNotificationBanner(
        message: "Olá ${loggedUser.name}, seja bem vindo(a)",
      );
      state = HomeStateSuccess(loggedUser: loggedUser);
      return;
    }

    appController.logout();
  }
}
