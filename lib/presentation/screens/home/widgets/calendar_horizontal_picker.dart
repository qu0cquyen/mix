import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mix/styles/styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarHorizontalPicker extends StatefulWidget {
  const CalendarHorizontalPicker(
      {super.key, this.onSelectedDay, required this.currentDate});

  final DateTime currentDate;

  final Function(DateTime selectedDay)? onSelectedDay;

  @override
  State<CalendarHorizontalPicker> createState() =>
      _CalendarHorizontalPickerState();
}

class _CalendarHorizontalPickerState extends State<CalendarHorizontalPicker> {
  var dates = <DateTime>[];

  late DateTime currentDate;

  late final ItemScrollController itemScrollController;

  @override
  void initState() {
    super.initState();
    currentDate = widget.currentDate;
    itemScrollController = ItemScrollController();
    dates = dateGenerator(currentDate);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollTo();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DateTime> dateGenerator(DateTime currentSelectedDate) {
    int rangeDate = 15;
    final dates = <DateTime>[];

    for (var i = 1; i <= rangeDate; i++) {
      dates.add(currentSelectedDate.add(Duration(days: i)));
    }

    for (var i = rangeDate; i >= 0; i--) {
      dates.add(currentSelectedDate.subtract(Duration(days: i)));
    }

    dates.sort((a, b) => a.compareTo(b));

    return dates;
  }

  void scrollTo() {
    int indexOfCurrentSelectedDate = dates.indexOf(currentDate);

    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: indexOfCurrentSelectedDate - 3,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      scrollDirection: Axis.horizontal,
      itemCount: dates.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 50.0,
          child: Column(
            children: [
              Text(DateFormat('EEE').format(dates[index])),
              InkWell(
                onTap: () {
                  widget.onSelectedDay?.call(dates[index]);

                  setState(() {
                    currentDate = dates[index];
                    dates = dateGenerator(currentDate);
                    scrollTo();
                  });
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: dates[index] == currentDate
                        ? AppColors.primaryColor
                        : null,
                    shape: BoxShape.circle,
                    boxShadow: dates[index] == currentDate
                        ? [
                            BoxShadow(
                              color: AppColors.secondaryColor,
                              offset: const Offset(2, 2),
                              blurRadius: 3.0,
                            )
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppInsets.md),
                    child: Text(
                      DateFormat('d').format(dates[index]),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: dates[index] == currentDate
                                ? FontWeight.bold
                                : null,
                            color: dates[index] == currentDate
                                ? Colors.white
                                : null,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
