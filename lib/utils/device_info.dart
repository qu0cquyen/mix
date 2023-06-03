import 'package:flutter/widgets.dart';

enum DeviceType { monitor, smallPhone, largePhone, tablet }

class DeviceScreen {
  static DeviceType get(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide <= 300) return DeviceType.smallPhone;
    if (shortestSide <= 600) return DeviceType.largePhone;
    if (shortestSide <= 900) return DeviceType.tablet;
    return DeviceType.monitor;
  }

  static bool isPhone(BuildContext context) =>
      isSmallPhone(context) || isLargePhone(context);
  static bool isTablet(BuildContext context) =>
      get(context) == DeviceType.tablet;
  static bool isMonitor(BuildContext context) =>
      get(context) == DeviceType.monitor;
  static bool isSmallPhone(BuildContext context) =>
      get(context) == DeviceType.smallPhone;
  static bool isLargePhone(BuildContext context) =>
      get(context) == DeviceType.largePhone;
}
