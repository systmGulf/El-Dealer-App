import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/styles/app_colors.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    required this.currentIndex,
    required this.iconImage,
    required this.selectedIndex,
  });
  final int currentIndex;
  final int selectedIndex;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor:
          currentIndex == selectedIndex
              ? AppColors.orangeColor.withOpacity(0.2)
              : Colors.transparent,
      child: SvgPicture.asset(
        iconImage,
        height: 20.h,
        width: 20.w,
        color:
            currentIndex == selectedIndex
                ? AppColors.orangeColor
                : Colors.white,
      ),
    );
  }
}
