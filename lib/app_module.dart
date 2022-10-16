import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/auth/login/login_page.dart';
import 'package:todo_app/modules/auth/register/register_page.dart';
import 'package:todo_app/modules/home/home_page.dart';

import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashPage.routeName,
          child: (context, _) => const SplashPage(),
        ),
        ChildRoute(
          LoginPage.routeName,
          child: (context, _) => const LoginPage(),
        ),
        ChildRoute(
          RegisterPage.routeName,
          child: (context, _) => const RegisterPage(),
        ),
        ChildRoute(
          HomePage.routeName,
          child: (context, _) => const HomePage(),
        ),
      ];
}
