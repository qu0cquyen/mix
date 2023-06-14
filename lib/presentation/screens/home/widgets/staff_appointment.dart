import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/styles/styles.dart';

class StaffAppointment extends StatelessWidget {
  const StaffAppointment({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return AppointmentItem(
                name: 'Adam Levi',
                serviceName: 'Theraphy',
                startTime: DateTime.now(),
                endTime: DateTime.now().add(const Duration(minutes: 30)),
                onItemPressed: () => context.pushNamed('appointment-detail'),
              );
            },
          ),
        );
      default:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
          child: AppointmentItem(
            name: 'Adam Levi',
            serviceName: 'Theraphy',
            startTime: DateTime.now(),
            endTime: DateTime.now().add(const Duration(minutes: 30)),
          ),
        );
    }
  }
}
