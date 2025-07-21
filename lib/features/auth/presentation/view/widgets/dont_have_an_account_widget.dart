import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/features/auth/presentation/view/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/styles/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        horizontalSpace(5),
        Text(
          'Don\'t have an account?'.tr(context: context),
          textAlign: TextAlign.center,
          style: AppTextStyles.font14MontserratRegular,
        ),
        horizontalSpace(5),
        GestureDetector(
          onTap: () {
            context.pushName(Routes.signUpScreen);
          },
          child: Text(
            ' Sign Up'.tr(context: context),
            textAlign: TextAlign.center,
            style: AppTextStyles.font14MontserratBold,
          ),
        ),
        Expanded(child: Divider()),
      
      ],
    );
  }
}
