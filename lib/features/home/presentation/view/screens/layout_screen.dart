import 'package:eldealer/core/screens/no_route_screen.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/features/home/presentation/view/screens/favourite_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/home_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/profile_screen.dart';
import 'package:eldealer/features/home/presentation/view/widgets/bottom_nav_Bar_icon.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF131515),
      bottomNavigationBar: IntrinsicHeight(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 15,

          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                currentIndex: currentIndex,
                selectedIndex: 0,
                iconImage: 'assets/svgs/home_icon.svg',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                currentIndex: currentIndex,
                selectedIndex: 1,
                iconImage: 'assets/svgs/favourite_icon.svg',
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                currentIndex: currentIndex,
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
          onTap: (int index) => setState(() => currentIndex = index),
          unselectedItemColor: Colors.white,
        ),
      ),
      body: getCurrentScreen(currentIndex),
    );
  }
}

// get current screen Function
Widget getCurrentScreen(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return const HomeScreen();
    case 1:
      return const FavouriteScreen();
    case 2:
      return const ProfileScreen();
    default:
      return const NoRouteScreen();
  }
}
