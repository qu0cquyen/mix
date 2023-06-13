import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';

class AppointmentDetail extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppoinmentDetailHeader();
  }

  @override
  String get routeName => 'appointment-detail';

  @override
  String get routePath => '/appointment-detail';
}
