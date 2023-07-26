import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';
import 'package:mix/widgets/button.dart';

class AppointmentDetailCurrent extends StatelessWidget {
  const AppointmentDetailCurrent({
    required this.serviceName,
    required this.duration,
    this.notes,
    this.onDeletePressed,
    this.onCompeletePressed,
    super.key,
  });

  final String serviceName;
  final int duration;
  final String? notes;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onCompeletePressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppInsets.sm / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Service: '),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: AppInsets.lg),
                        child: const Text('Duration: '),
                      ),
                      const Text('Notes: '),
                    ],
                  ),
                ),
                SizedBox(width: AppTypography.fontSizeHeadline4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(serviceName),
                          InkWell(
                            onTap: onDeletePressed,
                            child: Icon(
                              Icons.delete_outline,
                              color: AppColors.errorColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppInsets.lg,
                        ),
                        child: Text('$duration min(s)'),
                      ),
                      Wrap(
                        children: [
                          Text(notes ?? 'N/A'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 2.0,
          left: 1.0,
          right: 1.0,
          child: AppButton.primaryButton(
            onPressed: onCompeletePressed,
            child: Text(
              'Completed',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
