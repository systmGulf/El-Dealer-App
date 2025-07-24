import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_text_styles.dart';

class SignUpScreenText extends StatelessWidget {
  const SignUpScreenText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create Account'.tr(context: context),
          style: AppTextStyles.font20MontserratBold,
        ),
        verticalSpace(8),
        Opacity(
          opacity: 0.50,
          child: Text(
            'Sign up now and enjoy rental ease like \nnever before.'.tr(
              context: context,
            ),
            textAlign: TextAlign.center,
            style: AppTextStyles.font14MontserratRegularWithOpacity3,
          ),
        ),
      ],
    );
  }
}
