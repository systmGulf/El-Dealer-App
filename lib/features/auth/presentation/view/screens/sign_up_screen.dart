import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_app_button.dart';
import '../widgets/sign_up_bloc_listener.dart';
import '../widgets/sign_up_screen_text.dart';
import '../widgets/sign_up_text_form_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(30),
                  SignUpScreenText(),
                  verticalSpace(30),
                  SignUpTextFields(),
                  verticalSpace(30),
                  FadeInUp(
                    child: CustomAppButton(
                      onPressed: () => validateAndLogin(context),
                      textButton: 'Sign Up'.tr(context: context),
                      buttonColor: AppColors.orangeColor,
                    ),
                  ),

                  verticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        'Already have an account?'.tr(context: context),
                        style:
                            AppTextStyles.font14MontserratRegularWithOpacity2,
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
                      SignUpBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndLogin(BuildContext context) {
    if (context.read<SignUpCubit>().signUpFormKey.currentState!.validate()) {
      context.read<SignUpCubit>().doSignUp();
    }
  }
}
