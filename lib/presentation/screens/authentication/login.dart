import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/styles/styles.dart';
import 'package:mix/widgets/button.dart';
import 'package:mix/widgets/text_field.dart';

class LoginScreen extends Screen implements InitialScreen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppInsets.lg * 2),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppInsets.lg),
                    child: Text(
                      'Welcome to MIX',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  AppTextField.primary(
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      size: AppTypography.fontSizeHeadline3,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppInsets.lg),
                    child: AppTextField.primary(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: AppTypography.fontSizeHeadline3,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    height: MediaQuery.sizeOf(context).height / 15,
                    child: AppButton.primaryButton(
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => 'login';

  @override
  String get routePath => '/login';
}
