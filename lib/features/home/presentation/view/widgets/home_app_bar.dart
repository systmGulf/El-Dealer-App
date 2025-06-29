import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white.withOpacity(0.1),

          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/menu_icon.svg',
              color: Colors.white,
              height: 20.h,
            ),
          ),
        ),
        Spacer(),
        Image.asset('assets/images/app_logo_without_bg.png', height: 70.h),
        Spacer(),

        SvgPicture.asset('assets/svgs/notification_icon.svg'),
      ],
    );
  }
}
