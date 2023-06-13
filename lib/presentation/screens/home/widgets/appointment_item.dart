import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mix/styles/styles.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.serviceName,
    this.onDeletePressed,
    this.onItemPressed,
    super.key,
  });

  final DateTime startTime;
  final DateTime endTime;
  final String name;
  final String serviceName;
  final VoidCallback? onItemPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    final duration = endTime.difference(startTime).inMinutes;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(DateFormat('hh:mm').format(startTime)),
                Text(
                  DateFormat('a').format(startTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: AppInsets.sm),
                child: Column(
                  children: [
                    Divider(color: AppColors.primaryColor.shade50),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: onItemPressed,
                            child: Card(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: AppCorners.lgBorder,
                                side: BorderSide(
                                  color: AppColors.primaryColor.shade50,
                                ),
                              ),
                              elevation: 5.0,
                              child: Padding(
                                padding: EdgeInsets.all(AppInsets.md),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '$serviceName -',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor,
                                              ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppInsets.sm),
                                          child: Icon(
                                            Icons.schedule_outlined,
                                            color: AppColors.primaryColor,
                                            size: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .fontSize,
                                          ),
                                        ),
                                        Text(
                                          '$duration min(s)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onDeletePressed,
                          icon: Icon(
                            Icons.delete_outline,
                            color: AppColors.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(DateFormat('hh:mm').format(endTime)),
                Text(
                  DateFormat('a').format(endTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: AppInsets.sm),
                child: Divider(
                  color: AppColors.primaryColor.shade50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
