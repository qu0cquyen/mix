import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mix/presentation/screens/home/states/bottom_provider.dart';
import 'package:mix/styles/styles.dart';

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({super.key, this.onTap});

  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigatorIndex =
        ref.watch(currentSelectionBottomNavigatorProvider);

    return BottomNavigationBar(
      onTap: (index) {
        ref.read(currentSelectionBottomNavigatorProvider.notifier).state =
            index;

        onTap?.call(index);
      },
      currentIndex: bottomNavigatorIndex,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Calendar',
          icon: Icon(Icons.calendar_month_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Contact',
          icon: Icon(Icons.perm_contact_cal_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}
