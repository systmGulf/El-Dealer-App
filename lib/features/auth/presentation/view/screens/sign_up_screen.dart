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
                  'Create Account',
                  style: AppTextStyles.font20MontserratBold,
                ),
                verticalSpace(8),
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    'Sign up now and enjoy rental ease like \nnever before.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity3,
                  ),
                ),
                verticalSpace(30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(hint: 'Enter Name'),
                verticalSpace(30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(hint: 'Enter Email'),
                verticalSpace(30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(hint: 'Enter Password'),
                verticalSpace(30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity2,
                  ),
                ),
                verticalSpace(5),
                CustomAppTextFormField(hint: 'Confirm Password'),
                verticalSpace(30),
                CustomAppButton(
                  onPressed: () => context.pushName(Routes.homeScreen),
                  textButton: 'Sign Up',
                  buttonColor: AppColors.orangeColor,
                ),

                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      'Already have an account?',
                      style: AppTextStyles.font14MontserratRegularWithOpacity2,
                    ),
                    horizontalSpace(5),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Text(
                        'Sign In',
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
