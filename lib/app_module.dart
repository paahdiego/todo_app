import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app_routes.dart';
import 'package:todo_app/modules/auth/login/login_page.dart';
import 'package:todo_app/modules/auth/register/register_page.dart';
import 'package:todo_app/modules/home/home_page.dart';
import 'package:todo_app/modules/notes/pages/create_note_page.dart';

import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.splash,
          child: (context, _) => const SplashPage(),
        ),
        ChildRoute(
          AppRoutes.login,
          child: (context, _) => const LoginPage(),
        ),
        ChildRoute(
          AppRoutes.register,
          child: (context, _) => const RegisterPage(),
        ),
        ChildRoute(
          AppRoutes.home,
          child: (context, _) => const HomePage(),
        ),
        ChildRoute(
          AppRoutes.createNote,
          child: (context, arguments) {
            final loggedUserId = arguments.data as String;
            return CreateNotePage(loggedUserId: loggedUserId);
          },
        ),
      ];
}
