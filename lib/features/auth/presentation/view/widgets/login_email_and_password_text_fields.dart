import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_regex.dart';
import 'package:eldealer/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';

class LoginEmailAndPasswordTextFields extends StatefulWidget {
  const LoginEmailAndPasswordTextFields({super.key});

  @override
  State<LoginEmailAndPasswordTextFields> createState() =>
      _LoginEmailAndPasswordTextFieldsState();
}

class _LoginEmailAndPasswordTextFieldsState
    extends State<LoginEmailAndPasswordTextFields> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Email'.tr(context: context),
              textAlign: TextAlign.center,
              style: AppTextStyles.font14MontserratRegularWithOpacity2,
            ),
          ),
          verticalSpace(8),
          CustomAppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty || AppRegex.isEmailValid(value) == false) {
                return 'please enter a valid email user@example.com'.tr(
                  context: context,
                );
              }
              return null;
            },
            hint: 'Enter your email'.tr(context: context),
          ),
          verticalSpace(20),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Password'.tr(context: context),
              textAlign: TextAlign.center,
              style: AppTextStyles.font14MontserratRegularWithOpacity,
            ),
          ),
          verticalSpace(8),
          CustomAppTextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value!.isEmpty || AppRegex.isPasswordValid(value) == false) {
                return 'please enter a valid password'.tr(context: context);
              }
              return null;
            },
            obscureText: !isPasswordVisible,
            suffixIcon: IconButton(
              icon:
                  isPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            hintStyle: AppTextStyles.font14MediumRed.copyWith(
              color: Color(0xFFB8BEC5),
            ),
            controller: context.read<LoginCubit>().passwordController,
            hint: '************'.tr(context: context),
          ),
        ],
      ),
    );
  }
}
