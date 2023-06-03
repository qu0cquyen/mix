import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class AppTheme extends Equatable {
  const AppTheme({required this.themeData});

  final ThemeData themeData;

  factory AppTheme.basic() => AppTheme(
        themeData: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.primaryColor,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: AppColors.secondaryColor.shade100,
          fontFamily: 'Montserrat',
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            buttonColor: AppColors.primaryColor,
          ),
          textTheme: TextTheme(
            headlineLarge: AppTypography.headline1,
            headlineMedium: AppTypography.headline2,
            headlineSmall: AppTypography.headline3,
            displayLarge: AppTypography.headline4,
            displaySmall: AppTypography.bodyText1,
            bodyLarge: AppTypography.bodyText2,
            bodyMedium: AppTypography.subText1,
            bodySmall: AppTypography.subText2,
          ),
        ),
      );

  @override
  List<Object?> get props => [themeData];
}
