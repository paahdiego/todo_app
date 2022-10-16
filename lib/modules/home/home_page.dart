import 'package:flutter/material.dart';
import 'package:todo_app/app_controller.dart';

import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/home/components/home_page_body.dart';
import 'package:todo_app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/modules/home/home_state.dart';
import 'package:todo_app/modules/theme/theme_controller.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController homeController;
  @override
  void initState() {
    homeController = HomeController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance(context);

    return AnimatedBuilder(
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient(context),
          ),
          child: SafeArea(
            child: Scaffold(
              body: ValueListenableBuilder<HomeState>(
                valueListenable: homeController.stateNotifier,
                builder: (context, state, _) {
                  if (state.runtimeType == HomeStateEmpty) return Container();

                  if (state.runtimeType == HomeStateSuccess) {
                    final sucessState = state as HomeStateSuccess;
                    return HomePageBody(loggedUser: sucessState.loggedUser);
                  }
                  return const Center(child: AppLoadingIcon());
                },
              ),
            ),
          ),
        );
      },
      animation: themeController,
    );
  }
}
