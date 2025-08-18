import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNotFoundWidget extends StatelessWidget {
  const ImageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/app_logo_without_bg.png', height: 100.h),

        Text(
          "Image not found".tr(context: context),
          style: AppTextStyles.font12SatoshiRegular.copyWith(
            color: Colors.black.withValues(alpha: 166),
          ),
        ),
      ],
    );
  }
}
