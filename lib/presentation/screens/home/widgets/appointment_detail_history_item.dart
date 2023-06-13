import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class AppointmentDetailHistoryItem extends StatelessWidget {
  const AppointmentDetailHistoryItem({
    required this.date,
    required this.serviceName,
    this.notes,
    required this.duration,
    super.key,
  });

  final String date;
  final String serviceName;
  final String? notes;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppInsets.lg, top: AppInsets.sm),
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: AppCorners.mdBorder,
              side: BorderSide(
                color: AppColors.primaryColor.shade50,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppInsets.lg, vertical: AppInsets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        serviceName,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: AppTypography.fontSizeSubText2 / 2,
                          ),
                          Text(
                            '$duration min(s)',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (notes != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppInsets.sm),
                      child: Wrap(
                        children: [
                          Text(notes!),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
