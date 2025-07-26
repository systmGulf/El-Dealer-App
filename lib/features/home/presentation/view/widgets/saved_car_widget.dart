import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_spaces.dart';

class SavedCarWidget extends StatelessWidget {
  const SavedCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,

      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0x669747FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/favourite_icon.svg'),
          horizontalSpace(8),
          Text(
            'Saved Cars'.tr(context: context),
            style: AppTextStyles.font18BoldWhite,
          ),
        ],
      ),
    );
  }
}
