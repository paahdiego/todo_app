import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_controller.dart';

import 'modules/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider<AppController>(
          create: (context) => AppController(),
        ),
      ],
      builder: (context, _) {
        return Consumer<ThemeController>(
          builder: (context, themeController, __) {
            return OverlaySupport.global(
              child: MaterialApp.router(
                title: 'Notes App',
                debugShowCheckedModeBanner: false,
                theme: AppThemes.lightTheme(context),
                darkTheme: AppThemes.darkTheme(context),
                themeMode: themeController.themeMode,
                routeInformationParser: Modular.routeInformationParser,
                routerDelegate: Modular.routerDelegate,
              ),
            );
          },
        );
      },
    );
  }
}
