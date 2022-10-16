import 'package:flutter/material.dart';
import 'package:todo_app/app_controller.dart';

import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/theme/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance(context);
    final appController = AppController.instance(context);

    return AnimatedBuilder(
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient(context),
          ),
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.subBackgroundColor(context),
                      borderRadius: AppSizes.defaultBorderRadius,
                    ),
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.blackOrWhite(context),
                              size: 48,
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.dark_mode,
                                size: 24,
                                color: AppColors.blackOrWhite(context),
                              ),
                              onPressed: () {
                                themeController.changeTheme(context);
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Fulano da silva",
                              style: AppTextStyles.bodyText1(context)?.copyWith(
                                fontSize: 32,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.power_settings_new,
                                size: 24,
                                color: AppColors.blackOrWhite(context),
                              ),
                              onPressed: () {
                                appController.logout(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      animation: themeController,
    );
  }
}
