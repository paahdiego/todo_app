import 'package:flutter/material.dart';
import 'package:todo_app/modules/auth/login/components/login_body.dart';
import 'package:todo_app/shared/components/app_gradient_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          body: LoginBody(),
        ),
      ),
    );
  }
}
