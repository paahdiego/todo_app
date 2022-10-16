import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todo_app/modules/core/core.dart';

export 'theme_controller.dart';
export 'theme_controller.dart';

class AppThemes {
  static ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.transparent,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.transparent,
          elevation: 0.0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.caption(context)?.copyWith(fontSize: 14),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppSizes.defaultBorderRadius,
            ),
            textStyle: AppTextStyles.bodyText2(context)?.copyWith(fontSize: 16),
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.drawerBackgroundColorDark,
          scrimColor: AppColors.backgroundColorDark.withOpacity(0.5),
          elevation: 2.0,
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          iconColor: AppColors.primary,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        primaryIconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.fontColorDark,
                displayColor: AppColors.fontColorDark,
              ),
        ),
      );
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.transparent,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.transparent,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.caption(context)?.copyWith(fontSize: 14),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppSizes.defaultBorderRadius,
            ),
            textStyle: AppTextStyles.bodyText2(context)?.copyWith(fontSize: 16),
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.drawerBackgroundColorLight,
          scrimColor: AppColors.white.withOpacity(0.5),
          elevation: 2.0,
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          iconColor: AppColors.primary,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        primaryIconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.fontColorLight,
                displayColor: AppColors.fontColorLight,
              ),
        ),
      );
}
