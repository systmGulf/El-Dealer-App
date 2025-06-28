import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/routing/routes.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/core/widgets/custom_app_button.dart';
import 'package:eldealer/core/widgets/custom_app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(100),
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
              Text('Sign In', style: AppTextStyles.font20MontserratBold),
              verticalSpace(8),
              SizedBox(
                width: 345,
                child: Opacity(
                  opacity: 0.50,
                  child: Text(
                    'Sign up now and enjoy rental ease like \nnever before.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegularWithOpacity3,
                  ),
                ),
              ),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14MontserratRegularWithOpacity2,
                ),
              ),
              verticalSpace(8),
              CustomAppTextFormField(hint: 'Enter your email'),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14MontserratRegularWithOpacity,
                ),
              ),
              verticalSpace(8),
              CustomAppTextFormField(hint: 'Enter your password'),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratBold,
                  ),
                ],
              ),
              verticalSpace(20),
              CustomAppButton(
                onPressed: () {
                  context.pushName(Routes.homeScreen);
                },
                textButton: 'Sign In',
                buttonColor: AppColors.orangeColor,
              ),
              verticalSpace(50),
              Row(
                children: [
                  Expanded(child: Divider()),
                  horizontalSpace(5),
                  Text(
                    'Don\'t have an account?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14MontserratRegular,
                  ),
                  horizontalSpace(5),
                  GestureDetector(
                    onTap: () {
                      context.pushName(Routes.signUpScreen);
                    },
                    child: Text(
                      ' Sign Up',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font14MontserratBold,
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
