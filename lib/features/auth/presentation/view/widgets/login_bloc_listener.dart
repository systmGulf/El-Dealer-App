import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/features/auth/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/dependacy_injection/get_it.dart';
import '../../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          context.pop();
          DelightToastBar(
            autoDismiss: true,
            builder:
                (context) => ToastCard(
                  color: Colors.red,
                  leading: Icon(Icons.error_outline, size: 28),
                  title: Text(
                    state.message,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
        } else if (state is LoginSuccess) {
          context.pushName(Routes.homeScreen);
        } else if (state is LoginLoading) {
          showDialog(
            context: context,
            builder:
                (context) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 2,
                        backgroundColor: Colors.white,
                      ),
                      verticalSpace(10),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
