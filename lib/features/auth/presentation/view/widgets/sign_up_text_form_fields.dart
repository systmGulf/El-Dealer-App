import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app_regex.dart';
import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../controller/sign_up_cubit/sign_up_cubit.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({super.key});

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().signUpFormKey,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Name'.tr(context: context),
              textAlign: TextAlign.center,
              style: AppTextStyles.font14MontserratRegularWithOpacity2,
            ),
          ),
          verticalSpace(5),
          FadeInLeft(
            child: CustomAppTextFormField(
              hint: 'Enter Name'.tr(context: context),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter a valid name'.tr(context: context);
                }
                return null;
              },
              controller: context.read<SignUpCubit>().nameController,
              keyboardType: TextInputType.text,
            ),
          ),
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
          FadeInLeft(
            child: CustomAppTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter a valid email'.tr(context: context);
                }
                return null;
              },
              hint: 'Enter Email'.tr(context: context),
            ),
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
          FadeInRight(
            child: CustomAppTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              obscureText: isPasswordVisible ? false : true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              validator: (value) {
                if (!AppRegex.isPasswordValid(value!)) {
                  return 'please enter a valid password'.tr(context: context);
                }
                return null;
              },
              hint: 'Enter Password'.tr(context: context),
            ),
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
          FadeInRight(
            child: CustomAppTextFormField(
              controller: context.read<SignUpCubit>().confirmPasswordController,
              obscureText: isConfirmPasswordVisible ? false : true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              validator: (value) {
                if (value !=
                    context.read<SignUpCubit>().passwordController.text) {
                  return 'passwords do not match'.tr(context: context);
                }
                return null;
              },
              hint: 'Confirm Password'.tr(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
