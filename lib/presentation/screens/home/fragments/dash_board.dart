import 'package:flutter/material.dart';
import 'package:mix/presentation/screens/home/widgets/chart.dart';
import 'package:mix/presentation/screens/home/widgets/greetings.dart';
import 'package:mix/presentation/screens/home/widgets/notification.dart';
import 'package:mix/presentation/screens/home/widgets/up_coming.dart';
import 'package:mix/styles/app_insets.dart';
import 'package:mix/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(smallPhone: (context) => const _SmallPhoneWidget());
  }
}

class _SmallPhoneWidget extends StatelessWidget {
  const _SmallPhoneWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Greetings(),
                NotificationButton(
                  onTap: () => print('Notification Click'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Text(
                'Oliver Queen',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
            child: const UpComing(),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppInsets.xs / 2),
            child: const Chart(),
          ),
        ],
      ),
    );
  }
}
