import 'package:eldealer/features/home/presentation/view/widgets/bottom_nav_Bar_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({super.key, required this.currentIndex});
  int currentIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      iconSize: 15,

      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: BottomNavBarIcon(
            currentIndex: widget.currentIndex,
            selectedIndex: 0,
            iconImage: 'assets/svgs/home_icon.svg',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarIcon(
            currentIndex: widget.currentIndex,
            selectedIndex: 1,
            iconImage: 'assets/svgs/profile_icon.svg',
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarIcon(
            currentIndex: widget.currentIndex,
            selectedIndex: 2,
            iconImage: 'assets/svgs/profile_icon.svg',
          ),
          label: 'Profile',
        ),
      ],
      backgroundColor: AppColors.lightBlackColor,
      selectedItemColor: AppColors.orangeColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) => setState(() => widget.currentIndex = index),
      unselectedItemColor: Colors.white,
    );
  }
}
