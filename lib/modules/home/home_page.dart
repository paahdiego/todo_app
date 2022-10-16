import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/theme/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                Icons.mode_edit,
                                size: 24,
                              ),
                              onPressed: () {},
                            ),
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
