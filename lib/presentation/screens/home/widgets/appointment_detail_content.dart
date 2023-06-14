import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/home/widgets/widgets.dart';
import 'package:mix/styles/styles.dart';

class AppoinmentDetaiContent extends StatefulWidget {
  const AppoinmentDetaiContent({
    super.key,
  });

  @override
  State<AppoinmentDetaiContent> createState() => _AppoinmentDetaiContentState();
}

class _AppoinmentDetaiContentState extends State<AppoinmentDetaiContent>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final ScrollController scrollController;

  final double maxExtend = 210;
  final double minExtend = 60;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (tabController.index == 0) {
        scrollController.jumpTo(0);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
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
            decoration: const BoxDecoration(
              color: Colors.white,
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
          duration: const Duration(milliseconds: 100),
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
            duration: const Duration(milliseconds: 100),
            child: SizedBox(
              height: minExtent,
              child: AppBar(
                elevation: 5,
                surfaceTintColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => context.pop(),
                ),
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
