import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/home/home_page.dart';

import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, _) => const SplashPage()),
        ChildRoute('/home', child: (context, _) => const HomePage()),
      ];
}
