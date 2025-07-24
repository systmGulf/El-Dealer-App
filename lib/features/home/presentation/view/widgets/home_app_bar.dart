import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),

        Spacer(),

        Image.asset('assets/images/app_logo_without_bg.png', height: 80.h),
        Spacer(),

        SvgPicture.asset('assets/svgs/notification_icon.svg'),
      ],
    );
  }
}
