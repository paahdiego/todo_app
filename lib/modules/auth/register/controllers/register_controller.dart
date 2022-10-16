import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/auth/auth_service.dart';
import 'package:todo_app/modules/auth/register/models/register_response.dart';
import 'package:todo_app/shared/utils/app_notifications.dart';

class RegisterController {
  final pageStateNotifier = ValueNotifier<PageState>(PageState.notLoading);

  set pageState(PageState state) => pageStateNotifier.value = state;
  PageState get pageState => pageStateNotifier.value;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      pageState = PageState.loading;

      await Future.delayed(const Duration(seconds: 2));

      final authService = AuthService();

      try {
        final createdUser = await authService.createAccount(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
        Modular.to.pop(
          RegisterResponse(
            shouldAdjustControllers: true,
            user: createdUser,
          ),
        );
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
