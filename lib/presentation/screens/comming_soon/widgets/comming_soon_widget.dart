import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}
