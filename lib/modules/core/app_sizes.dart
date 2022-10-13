import 'package:flutter/material.dart';

class AppSizes {
  late ValueNotifier<DeviceType> deviceNotifier;

  DeviceType get deviceType => deviceNotifier.value;

  late double displayWidth;
  late double displayHeight;

  late MediaQueryData mediaQuery;

  double get paddingTop => padding.top;
  double get paddingBottom => padding.bottom;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get defaultPadding => EdgeInsets.all(defaultPaddingSize);
  static double get defaultPaddingSize => 20;

  double get safeHeight => displayHeight - padding.top - padding.bottom;

  static BorderRadius get defaultBorderRadius =>
      const BorderRadius.all(Radius.circular(8));

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
