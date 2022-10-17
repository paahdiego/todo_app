import 'package:flutter/material.dart';

import 'package:todo_app/modules/auth/auth_controller.dart';
import 'package:todo_app/shared/components/app_gradient_container.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';
import 'package:todo_app/shared/components/app_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        AuthController.isAuthenticated(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              Spacer(),
              Center(child: AppLogo()),
              SizedBox(height: 50),
              AppLoadingIcon(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
