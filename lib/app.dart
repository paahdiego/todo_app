import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

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
      ],
      builder: (context, _) {
        final themeController = ThemeController.instance(context, listen: true);

        return Consumer<ThemeController>(
          builder: (context, _, __) {
            return MaterialApp.router(
              title: 'Todo App',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme(context),
              darkTheme: AppThemes.darkTheme(context),
              themeMode: themeController.themeMode,
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
            );
          },
        );
      },
    );
  }
}
