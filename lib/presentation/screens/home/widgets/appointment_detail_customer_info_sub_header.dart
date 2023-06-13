import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class AppointmentDetailCustomerInfoSubHeader extends StatelessWidget {
  const AppointmentDetailCustomerInfoSubHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Adam Levi',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppInsets.lg),
          child: Row(
            children: [
              Text('Visit: ', style: Theme.of(context).textTheme.bodyMedium),
              Text('15', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Phone: ', style: Theme.of(context).textTheme.bodyMedium),
                Text('(123) 456-7890',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondaryColor),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(AppInsets.sm),
                    child: Icon(
                      Icons.comment_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: AppInsets.lg),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondaryColor),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(AppInsets.sm),
                    child: Icon(
                      Icons.call_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
