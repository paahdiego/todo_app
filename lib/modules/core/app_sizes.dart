import 'package:flutter/material.dart';

class AppSizes {
  static double get defaultBorderRadiusSize => 16;

  static double get defaultPaddingSize => 16;

  static BorderRadius get defaultBorderRadius => BorderRadius.all(
        Radius.circular(defaultBorderRadiusSize),
      );

  DeviceType get deviceType => deviceNotifier.value;
  double get paddingTop => padding.top;
  double get paddingBottom => padding.bottom;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get defaultPadding => EdgeInsets.all(defaultPaddingSize);
  double get safeHeight => displayHeight - padding.top - padding.bottom;

  late ValueNotifier<DeviceType> deviceNotifier;
  late double displayWidth;
  late double displayHeight;
  late MediaQueryData mediaQuery;

  final BuildContext context;

  AppSizes(this.context) {
    mediaQuery = MediaQuery.of(context);
    displayWidth = mediaQuery.size.width;
    displayHeight = mediaQuery.size.height;

    if (displayWidth >= 1100) {
      deviceNotifier = ValueNotifier<DeviceType>(DeviceType.desktop);
    } else if (displayWidth >= 768) {
      deviceNotifier = ValueNotifier<DeviceType>(DeviceType.tablet);
    } else {
      deviceNotifier = ValueNotifier<DeviceType>(DeviceType.mobile);
    }
  }

  bool isMobile() => deviceType == DeviceType.mobile;

  bool isTablet() => deviceType == DeviceType.tablet;

  bool isDesktop() => deviceType == DeviceType.desktop;

  @override
  String toString() {
    return 'AppSizes( displayWidth: $displayWidth, displayHeight: $displayHeight, deviceType: $deviceType )';
  }
}

enum DeviceType { desktop, mobile, tablet }
