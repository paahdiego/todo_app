import 'package:flutter/material.dart';
import 'package:todo_app/modules/core/app_network_images.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/home/components/user_avatar_image.dart';
import 'package:todo_app/shared/components/image_network_builder.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key? key,
    required this.name,
    required this.onChangeTheme,
    required this.onLogout,
  }) : super(key: key);

  final String name;
  final VoidCallback onChangeTheme;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.subBackgroundColor(context),
        borderRadius: AppSizes.defaultBorderRadius,
      ),
      padding: EdgeInsets.all(AppSizes.defaultPaddingSize),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAvatar(),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: AppTextStyles.bodyText1(context)?.copyWith(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.dark_mode,
                  size: 24,
                  color: AppColors.blackOrWhite(context),
                ),
                onPressed: onChangeTheme,
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: Icon(
                  Icons.power_settings_new,
                  size: 24,
                  color: AppColors.blackOrWhite(context),
                ),
                onPressed: onLogout,
              )
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
