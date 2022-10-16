import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/auth/auth_service.dart';
import 'package:todo_app/modules/splash/splash_page.dart';
import 'package:todo_app/shared/utils/app_notifications.dart';

class LoginController {
  final pageStateNotifier = ValueNotifier<PageState>(PageState.notLoading);

  set pageState(PageState state) => pageStateNotifier.value = state;
  PageState get pageState => pageStateNotifier.value;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      pageState = PageState.loading;

      final authService = AuthService();

      try {
        await authService.login(
          email: emailController.text,
          password: passwordController.text,
        );

        Modular.to.pushReplacementNamed(SplashPage.routeName);
      } catch (e) {
        AppNotifications.errorNotificationBanner(e);
      }

      pageState = PageState.notLoading;
    }
  }
}

enum PageState {
  loading,
  notLoading,
}
