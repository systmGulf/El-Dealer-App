import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(30),
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
                verticalSpace(30),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Name'.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(hint: 'Enter Name'.tr(context: context)),
                verticalSpace(30),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Email'.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(
                  hint: 'Enter Email'.tr(context: context),
                ),
                verticalSpace(30),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Password'.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(
                  hint: 'Enter Password'.tr(context: context),
                ),
                verticalSpace(30),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Confirm Password'.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(
                  hint: 'Confirm Password'.tr(context: context),
                ),
                verticalSpace(30),
                CustomAppButton(
                  onPressed: () => context.pushName(Routes.homeScreen),
                  textButton: 'Sign Up'.tr(context: context),
                  buttonColor: AppColors.orangeColor,
                ),

                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      'Already have an account?'.tr(context: context),
                      style: AppTextStyles.font14MontserratRegularWithOpacity2,
                    ),
                    horizontalSpace(5),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Text(
                        'Sign In'.tr(context: context),
                        style: AppTextStyles.font14MontserratBold,
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
