import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/shared/models/app_error.dart';

class AppNotifications {
  static void simpleNotificationBanner({
    required final String message,
  }) {
    showSimpleNotification(Text(message), background: AppColors.primary);
  }

  static void errorNotificationBanner(
    final Object object, {
    String? errorType,
    String? statusCode,
  }) {
    String message = object.toString();
    if (object.runtimeType == AppError) {
      final apiError = object as AppError;
      message = apiError.message;
      errorType = "App Error";
    }

    showSimpleNotification(
      Text(message),
      background: AppColors.error,
      elevation: 2.5,
      foreground: Colors.white,
      subtitle: statusCode != null ? Text("status code: $statusCode") : null,
      leading: errorType != null
          ? SizedBox(
              width: 55,
              child: Text(
                errorType,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          : null,
    );
  }
}
