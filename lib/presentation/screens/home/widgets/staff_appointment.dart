import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/styles/styles.dart';

class StaffAppointment extends StatefulWidget {
  const StaffAppointment({super.key});

  @override
  State<StaffAppointment> createState() => _StaffAppointmentState();
}

class _StaffAppointmentState extends State<StaffAppointment>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 8);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppCorners.mdBorder,
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppInsets.lg * 3),
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.all(AppInsets.lg),
                isScrollable: true,
                tabs: const [
                  Text('View All'),
                  Text('Staff 1'),
                  Text('Staff 2'),
                  Text('Staff 3'),
                  Text('Staff 4'),
                  Text('Staff 5'),
                  Text('Staff 6'),
                  Text('Staff 7'),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: MediaQuery.of(context).devicePixelRatio / 2.5,
              child: TabBarView(controller: tabController, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: Column(
                    children: [
                      AppointmentItem(
                        name: 'Adam Levi',
                        serviceName: 'Theraphy',
                        startTime: DateTime.now(),
                        endTime:
                            DateTime.now().add(const Duration(minutes: 30)),
                        onItemPressed: () =>
                            context.pushNamed('appointment-detail'),
                      ),
                      AppointmentItem(
                        name: 'Adam Levi',
                        serviceName: 'Theraphy',
                        startTime: DateTime.now(),
                        endTime:
                            DateTime.now().add(const Duration(minutes: 30)),
                      ),
                      AppointmentItem(
                        name: 'Adam Levi',
                        serviceName: 'Theraphy',
                        startTime: DateTime.now(),
                        endTime:
                            DateTime.now().add(const Duration(minutes: 30)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                  child: AppointmentItem(
                    name: 'Adam Levi',
                    serviceName: 'Theraphy',
                    startTime: DateTime.now(),
                    endTime: DateTime.now().add(const Duration(minutes: 30)),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
