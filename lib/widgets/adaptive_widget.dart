import 'package:flutter/material.dart';
import 'package:mix/utils/device_info.dart';

typedef AdaptiveBuild = Widget Function(BuildContext context);

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({
    AdaptiveBuild? smallPhone,
    AdaptiveBuild? largePhone,
    AdaptiveBuild? tablet,
    AdaptiveBuild? monitor,
    super.key,
  })  : _smallPhone = smallPhone ?? largePhone ?? tablet ?? monitor,
        _largePhone = largePhone ?? smallPhone ?? tablet ?? monitor,
        _tablet = tablet ?? monitor ?? largePhone ?? smallPhone,
        _monitor = monitor ?? tablet ?? largePhone ?? smallPhone,
        assert(smallPhone != null ||
            largePhone != null ||
            tablet != null ||
            monitor != null);

  final AdaptiveBuild? _smallPhone;
  final AdaptiveBuild? _largePhone;
  final AdaptiveBuild? _tablet;
  final AdaptiveBuild? _monitor;

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceScreen.get(context);

    switch (deviceType) {
      case DeviceType.smallPhone:
        return _smallPhone!.call(context);
      case DeviceType.largePhone:
        return _largePhone!.call(context);
      case DeviceType.tablet:
        return _tablet!.call(context);
      default:
        return _monitor!.call(context);
    }
  }
}
