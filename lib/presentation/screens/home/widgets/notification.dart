import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      borderRadius: AppCorners.lgBorder * 5,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(AppInsets.xs),
        padding: EdgeInsets.all(AppInsets.sm),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor.shade50,
          border: Border.all(color: AppColors.primaryColor.shade50),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.primaryColor.shade50,
              offset: const Offset(0.5, 3.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: 51,
          child: Icon(
            Icons.notifications_outlined,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
