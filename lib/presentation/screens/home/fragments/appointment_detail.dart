import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/widgets/widgets.dart';

class AppointmentDetail extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AdaptiveWidget(
      smallPhone: (context) => const AppoinmentDetaiContent(),
    );
  }

  @override
  String get routeName => 'appointment-detail';

  @override
  String get routePath => '/appointment-detail';
}
