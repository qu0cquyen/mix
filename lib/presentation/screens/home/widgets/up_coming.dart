import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppCorners.lgBorder,
        side: BorderSide(
          color: AppColors.primaryColor.shade50,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: AppInsets.lg),
      child: Padding(
        padding: EdgeInsets.all(AppInsets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Up coming:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: AppTypography.fontSizeHeadline1 * 2.5,
                  child: Text(
                    'Adam Levi ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size:
                          Theme.of(context).textTheme.bodySmall!.fontSize! + 5,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      'Today, 8:00 am - 9:30 am',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
