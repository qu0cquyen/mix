import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:mix/presentation/screens/comming_soon/widgets/comming_soon_widget.dart';
import 'package:mix/presentation/screens/home/fragments/appointment.dart';
import 'package:mix/presentation/screens/home/fragments/dash_board.dart';
import 'package:mix/presentation/screens/home/states/bottom_provider.dart';
import 'package:mix/presentation/screens/home/states/page_controller_provider.dart';
import 'package:mix/styles/styles.dart';

import 'widgets/bottom_navigator.dart';

class HomeScreen extends Screen implements InitialScreen {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              ref.read(currentSelectionBottomNavigatorProvider.notifier).state =
                  index;
            },
            children: const [
              DashboardScreen(),
              AppointmentScreen(),
              CommingSoonWidget(),
              CommingSoonWidget(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigator(
          onTap: (index) {
            ref.read(pageControllerProvider.notifier).state = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
        ),
        floatingActionButton: ref.watch(pageControllerProvider) == 1
            ? FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                onPressed: () {},
                child: Icon(
                  Icons.add_outlined,
                  color: Colors.white,
                  size: AppTypography.fontSizeHeadline3,
                ),
              )
            : null,
      );
    });
  }

  @override
  String get routeName => 'home';

  @override
  String get routePath => '/';
}
