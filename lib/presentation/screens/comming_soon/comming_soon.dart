import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/styles/styles.dart';

class CommingSoon extends Screen implements ErrorScreen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Text(
        'Comming soon',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.primaryColor,
            ),
      ))),
    );
  }

  @override
  String get routeName => 'comming-soon';

  @override
  String get routePath => '/comming-soon';
}
