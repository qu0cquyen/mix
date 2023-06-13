import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/styles/styles.dart';

class AppoinmentDetailHeader extends StatefulWidget {
  const AppoinmentDetailHeader({
    super.key,
  });

  @override
  State<AppoinmentDetailHeader> createState() => _AppoinmentDetailHeaderState();
}

class _AppoinmentDetailHeaderState extends State<AppoinmentDetailHeader>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  final double maxExtend = 210;
  final double minExtend = 50;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              pinned: true,
              delegate: _AppointmentPersistentHeaderDelegate(
                controller: tabController,
                maxHeight: maxExtend,
                minHeight: minExtend,
              ),
            ),
          ],
          body: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: AppCorners.lgRadius * 2,
                topRight: AppCorners.lgRadius * 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: AppInsets.lg),
              child: TabBarView(controller: tabController, children: [
                Padding(
                  padding: EdgeInsets.all(AppInsets.lg),
                  child: const AppointmentDetailCurrent(
                    serviceName: 'Service Name',
                    duration: 30,
                  ),
                ),
                const AppointmentDetailHistory()
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppointmentPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _AppointmentPersistentHeaderDelegate({
    required this.controller,
    required this.maxHeight,
    required this.minHeight,
  });

  final TabController controller;
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          opacity: 1 - (shrinkOffset / maxExtent),
          duration: const Duration(milliseconds: 200),
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
                      child: const AppointmentDetailCustomerInfoSubHeader(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: AppCorners.lgRadius * 2,
                          topRight: AppCorners.lgRadius * 2,
                        ),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(top: AppInsets.lg),
                      padding: EdgeInsets.only(
                          top: AppInsets.md, bottom: AppInsets.md),
                      child: TabBar(
                        controller: controller,
                        indicatorColor: AppColors.primaryColor,
                        labelColor: AppColors.primaryColor,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Text('Current'),
                          Text('History'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        Visibility(
          visible: shrinkOffset > 0,
          child: AnimatedOpacity(
            opacity: shrinkOffset / maxExtent,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: minExtent,
              child: AppBar(
                elevation: 5,
                surfaceTintColor: Colors.white,
                backgroundColor: AppColors.backgroundColor.shade50,
                title: Text(
                  'Adam Levi',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
