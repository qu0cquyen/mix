import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/presentation/states/home/selected_date_provider.dart';
import 'package:mix/presentation/states/home/staff_chosen_provider.dart';
import 'package:mix/styles/styles.dart';
import 'package:mix/widgets/widgets.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      smallPhone: (context) => const AppointmentScreenContent(),
    );
  }
}

class AppointmentScreenContent extends ConsumerStatefulWidget {
  const AppointmentScreenContent({super.key});

  @override
  ConsumerState<AppointmentScreenContent> createState() =>
      _AppointmentScreenContentState();
}

class _AppointmentScreenContentState
    extends ConsumerState<AppointmentScreenContent>
    with TickerProviderStateMixin {
  late final TabController tabController;

  late final AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: ref.read(staffDataProvider).length, vsync: this);

    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        if (tabController.index > tabController.previousIndex) {
          // From Right to Left
          setAnimationDirection(const Offset(1.0, 0.0));
          animationController.reset();
          animationController.forward();
          return;
        }

        if (tabController.index < tabController.previousIndex) {
          //From Left to Right
          setAnimationDirection(const Offset(-1.0, 0.0));

          animationController.reset();
          animationController.forward();
          return;
        }
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void setAnimationDirection(Offset offset) {
    setState(() {
      offsetAnimation = Tween<Offset>(
        begin: offset,
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDateState = ref.watch(selectedDateProvider);
    final staffData = ref.watch(staffDataProvider);
    final selectedStaff = ref.watch(staffChosenProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            color: AppColors.primaryColor.shade50,
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
                            value: selectedStaff,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                            items: dropDownItems(staffData),
                            onChanged: (staff) =>
                                onDropDownStaffChanged(staff, staffData),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppInsets.lg * 3),
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.all(AppInsets.lg),
                isScrollable: true,
                tabs: staffData.map((staff) => Text(staff)).toList(),
              ),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: SlideTransition(
            position: offsetAnimation,
            child: StaffAppointment(index: tabController.index),
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem> dropDownItems(List<String> staffData) {
    return staffData
        .map((staff) => DropdownMenuItem(
              value: staff,
              child: Text(staff),
            ))
        .toList();
  }

  void onDropDownStaffChanged(String? staff, List<String> staffData) {
    if (staff == null) {
      return;
    }
    ref.read(staffChosenProvider.notifier).state = staff;

    final indexOfStaff = staffData.indexOf(staff);
    if (indexOfStaff < 0) return;
    tabController.animateTo(indexOfStaff,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
