import 'package:eldealer/core/common/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/car_for_rent_conatiner.dart';
import '../widgets/categories_container.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/home_bg_image.png', fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              HomeAppBar(),
              verticalSpace(8),
              Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 128),
                  fontSize: 16,
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                ),
              ),
              verticalSpace(4),

              Text(
                'Osama Mahmoud',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.02,
                ),
              ),
              verticalSpace(18),

              Text(
                'Select Cars for rent',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                ),
              ),
              verticalSpace(16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CategoriesContainer(
                          index: index,
                          selectedIndex: selectedIndex,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(16),
              Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CarForRentConatiner(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
