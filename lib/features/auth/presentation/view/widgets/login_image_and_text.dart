import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_text_styles.dart';

class LoginImageAndText extends StatelessWidget {
  const LoginImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login_image.png',

              fit: BoxFit.scaleDown,
              width: 300.w,
            ),
          ],
        ),
        verticalSpace(20),
        Text(
          'Sign In'.tr(context: context),
          style: AppTextStyles.font20MontserratBold,
        ),
        verticalSpace(8),
        SizedBox(
          width: 345,
          child: Opacity(
            opacity: 0.50,
            child: Text(
              'Sign up now and enjoy rental ease like \nnever before.'.tr(
                context: context,
              ),
              textAlign: TextAlign.center,
              style: AppTextStyles.font14MontserratRegularWithOpacity3,
            ),
          ),
        ),
      ],
    );
  }
}
