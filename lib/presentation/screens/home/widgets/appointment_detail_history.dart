import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/styles/styles.dart';

class AppointmentDetailHistory extends StatelessWidget {
  const AppointmentDetailHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final historyItem = List.generate(
      10,
      (index) => HistoryItem(
        date: DateTime.now().add(Duration(days: index + 1)),
        serviceName: 'Service Name',
        duration: 30,
        notes: 'Extra description or reminders',
      ),
    );

    return ListView.builder(
      shrinkWrap: true,
      itemCount: historyItem.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
          child: AppointmentDetailHistoryItem(
            date: DateFormat('EEE, MM-dd-y').format(
              historyItem[index].date,
            ),
            serviceName: historyItem[index].serviceName,
            duration: historyItem[index].duration,
            notes: historyItem[index].notes,
          ),
        );
      },
    );
  }
}

class HistoryItem {
  const HistoryItem({
    required this.date,
    required this.serviceName,
    required this.duration,
    required this.notes,
  });

  final DateTime date;
  final String serviceName;
  final int duration;
  final String notes;
}
