import 'package:flutter/material.dart';
import 'package:todo_app/modules/auth/register/components/register_body.dart';
import 'package:todo_app/shared/components/app_gradient_container.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const String routeName = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          body: RegisterBody(),
        ),
      ),
    );
  }
}
