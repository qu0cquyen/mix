import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/styles/styles.dart';

class AppointmentDetail extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AppoinmentHeader();
  }

  @override
  String get routeName => 'appointment-detail';

  @override
  String get routePath => '/appointment-detail';
}

class AppointmentPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          opacity: 1 - (shrinkOffset / maxExtent),
          duration: const Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: AppColors.secondaryColor.shade100,
            ),
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
                  child: AppointmentCustomerInfoHeader(),
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: shrinkOffset / maxExtent,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: AppColors.secondaryColor.shade100,
            ),
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 160;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class AppoinmentHeader extends StatefulWidget {
  const AppoinmentHeader({
    super.key,
  });

  @override
  State<AppoinmentHeader> createState() => _AppoinmentHeaderState();
}

class _AppoinmentHeaderState extends State<AppoinmentHeader>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  late final TabController tabController;

  var offset = Offset.zero;

  var displayHeader = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    tabController = TabController(vsync: this, length: 2);

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // if (tabController.index == 0) {
    //   scrollController.jumpTo(0);
    // }
    if (scrollController.offset > 0) {
      setState(() {
        displayHeader = false;
      });
      return;
    }

    setState(() {
      displayHeader = true;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: NestedScrollView(
        //   controller: scrollController,
        //   floatHeaderSlivers: true,
        //   headerSliverBuilder: (context, innerBoxIsScrolled) {
        //     return [
        //       SliverOverlapAbsorber(
        //         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
        //           context,
        //         ),
        //         sliver: SliverAppBar(
        //           floating: true,
        //           pinned: true,
        //           snap: false,
        //           toolbarHeight: 170.0,
        //           automaticallyImplyLeading: false,
        //           backgroundColor: Colors.transparent,
        //           title: Visibility(
        //             visible: displayHeader,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 IconButton(
        //                   onPressed: () => context.pop(),
        //                   icon: const Icon(
        //                     Icons.arrow_back_ios_outlined,
        //                   ),
        //                 ),
        //                 AppointmentCustomerInfoHeader(),
        //               ],
        //             ),
        //           ),
        //           bottom: TabBar(
        //             controller: tabController,
        //             tabs: [
        //               Text('Current'),
        //               Text('History'),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ];
        //   },
        //   body: Padding(
        //     padding: const EdgeInsets.only(top: 120.0 - kToolbarHeight),
        //     child: DecoratedBox(
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //       ),
        //       child: TabBarView(
        //         controller: tabController,
        //         children: [
        //           Builder(builder: (context) {
        //             return CustomScrollView(
        //               slivers: [
        //                 // SliverOverlapInjector(
        //                 //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
        //                 //       context),
        //                 // ),
        //                 SliverPadding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   sliver: SliverList(
        //                     delegate: SliverChildBuilderDelegate(
        //                       (BuildContext context, int index) {
        //                         return ListTile(
        //                           title: Text('Item $index'),
        //                         );
        //                       },
        //                       childCount: 30,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             );
        //           }),
        //           Builder(builder: (context) {
        //             return CustomScrollView(
        //               slivers: [
        //                 // SliverOverlapInjector(
        //                 //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
        //                 //       context),
        //                 // ),
        //                 SliverPadding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   sliver: SliverList(
        //                     delegate: SliverChildBuilderDelegate(
        //                       (BuildContext context, int index) {
        //                         return ListTile(
        //                           title: Text('Item $index'),
        //                         );
        //                       },
        //                       childCount: 30,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             );
        //           }),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: AppointmentPersistentHeaderDelegate(),
            ),
            SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text(index.toString());
              },
            ),
          ],
        ),
        // child: NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) {
        //     return [
        //       SliverToBoxAdapter(
        //         child: Column(
        //           children: [
        //             IconButton(
        //               onPressed: () => context.pop(),
        //               icon: const Icon(
        //                 Icons.arrow_back_ios_outlined,
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
        //               child: AppointmentCustomerInfoHeader(),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ];
        //   },
        //   body: SliverPersistentHeader(
        //     delegate: SliverPersistentHeaderDelegate(),
        //   ),
        // ),

        // child: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       IconButton(
        //         onPressed: () => context.pop(),
        //         icon: const Icon(
        //           Icons.arrow_back_ios_outlined,
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: AppInsets.md),
        //         child: AppointmentCustomerInfoHeader(),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(top: AppInsets.lg),
        //         child: DecoratedBox(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(AppCorners.lg * 3),
        //               topRight: Radius.circular(AppCorners.lg * 3),
        //             ),
        //           ),
        //           child: Column(
        //             children: [
        //               TabBar(
        //                 indicatorColor: AppColors.primaryColor,
        //                 labelColor: AppColors.primaryColor,
        //                 dividerColor: Colors.transparent,
        //                 padding: EdgeInsets.all(AppInsets.lg),
        //                 controller: tabController,
        //                 onTap: (index) {
        //                   setState(() {
        //                     if (tabController.index == 0) {
        //                       offset = Offset.zero;
        //                       return;
        //                     }
        //                     offset = Offset(-0.0, 0.0);
        //                   });
        //                 },
        //                 tabs: const [
        //                   Text('Current'),
        //                   Text('History'),
        //                 ],
        //               ),
        //               ListView.builder(
        //                   shrinkWrap: true,
        //                   itemCount: 100,
        //                   itemBuilder: (context, index) {
        //                     return Text('Item $index');
        //                   }),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class AppointmentCustomerInfoHeader extends StatelessWidget {
  const AppointmentCustomerInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Adam Levi',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppInsets.lg),
          child: Row(
            children: [
              Text('Visit: ', style: Theme.of(context).textTheme.bodyMedium),
              Text('15', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Phone: ', style: Theme.of(context).textTheme.bodyMedium),
                Text('(123) 456-7890',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.secondaryColor.shade100),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(AppInsets.sm),
                    child: Icon(
                      Icons.comment_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: AppInsets.lg),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.secondaryColor.shade100),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(AppInsets.sm),
                    child: Icon(
                      Icons.call_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AppointmentDetailContent extends StatefulWidget {
  const AppointmentDetailContent({
    super.key,
  });

  @override
  State<AppointmentDetailContent> createState() =>
      _AppointmentDetailContentState();
}

class _AppointmentDetailContentState extends State<AppointmentDetailContent>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: AppCorners.lgBorder,
          ),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.all(AppInsets.lg),
                isScrollable: true,
                tabs: const [
                  Text('Current'),
                  Text('History'),
                ],
              ),
              TabBarView(
                controller: tabController,
                children: [
                  Text('Current'),
                  Text('History'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
