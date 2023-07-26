import 'package:flutter/material.dart';
import 'package:flutter_robusta/flutter_robusta.dart';
import 'package:mix/presentation/screens/authentication/login.dart';
import 'package:mix/presentation/screens/comming_soon/comming_soon.dart';
import 'package:mix/presentation/screens/home/fragments/appointment_detail.dart';
import 'package:mix/styles/styles.dart';
import 'package:mix/presentation/screens/home/screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

FlutterAppExtension appExtension() {
  WidgetsFlutterBinding.ensureInitialized();
  return FlutterAppExtension(
    materialAppSettings: MaterialAppSettings(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic().themeData,
    ),
    routerSettings: RouterSettings(
      navigatorKey: navigationKey,
      screenFactories: [
        (_) => LoginScreen(),
        (_) => HomeScreen(),
        (_) => AppointmentDetail(),
        (_) => CommingSoon(),
      ],
    ),
  );
}
