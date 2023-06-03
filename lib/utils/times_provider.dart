import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingProvider = StateProvider<String>(
  (ref) {
    final currentHour = DateTime.now().hour;
    if (currentHour < 12) {
      return 'Morning';
    }

    if (currentHour >= 12 && currentHour <= 17) {
      return 'Afternoon';
    }

    return 'Evening';
  },
);
