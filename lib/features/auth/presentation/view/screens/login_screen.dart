import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/common/context_extention.dart';

import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/core/widgets/custom_app_button.dart';
import 'package:eldealer/features/auth/controller/cubit/login_cubit.dart';
import 'package:eldealer/features/auth/presentation/view/widgets/email_and_password_text_fields.dart';
import 'package:eldealer/features/auth/presentation/view/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../widgets/dont_have_an_account_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                      'Sign up now and enjoy rental ease like \nnever before.'
                          .tr(context: context),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font14MontserratRegularWithOpacity3,
                    ),
                  ),
                ),
                verticalSpace(20),
                EmailAndPasswordTextFields(),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => context.pushName(Routes.homeScreen),
                      child: Text(
                        'Forgot Password?'.tr(context: context),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font14MontserratBold,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                CustomAppButton(
                  onPressed: () {
                    validateAndLogin(context);
                  },
                  textButton: 'Sign In'.tr(context: context),
                  buttonColor: AppColors.orangeColor,
                ),
                verticalSpace(50),
                DontHaveAnAccountWidget(),
                verticalSpace(20),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().doLogin();
    }
  }
}
