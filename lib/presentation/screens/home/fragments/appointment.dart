import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mix/presentation/screens/home/states/selected_date_provider.dart';
import 'package:mix/presentation/screens/home/widgets/calendar_horizontal_picker.dart';
import 'package:mix/presentation/screens/home/widgets/staff_appointment.dart';
import 'package:mix/styles/styles.dart';

class AppointmentScreen extends ConsumerWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = [
      'View All',
      'Staff 1',
      'Staff 2',
      'Staff 3',
      'Staff 4',
      'Staff 5',
      'Staff 6',
      'Staff 7',
    ];

    final selectedDateState = ref.watch(selectedDateProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
            child: Text(
              DateFormat('MMM yyyy').format(selectedDateState),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 68.0,
            child: CalendarHorizontalPicker(
              currentDate: selectedDateState,
              onSelectedDay: (date) =>
                  ref.read(selectedDateProvider.notifier).state = date,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppInsets.lg, horizontal: AppInsets.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Staff',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: AppInsets.sm),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppCorners.lgBorder,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryColor,
                          offset: const Offset(2, 2),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: SizedBox(
                      width: 120.0,
                      height: 28.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppInsets.xs, horizontal: AppInsets.md),
                        child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            underline: const SizedBox.shrink(),
                            value: data.first,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                            items: data
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (index) {}),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const StaffAppointment(),
        ],
      ),
    );
  }
}
