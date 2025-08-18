import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_loading_indicator.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/secure_cache.dart';
import '../../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
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
          await SecureCache.insertToCache(
            key: 'username',
            value: state.userDataResponse.value?.name ?? '',
          );
          // Get Users Value from Secure Cache

          ApiConstant.userName = await SecureCache.getFromCache(
            key: 'username',
          );
          if (!context.mounted) return;
          DelightToastBar(
            autoDismiss: true,
            builder:
                (context) => ToastCard(
                  color: Colors.green,
                  leading: Icon(Icons.error_outline, size: 28),
                  title: Text(
                    'Login Successfully',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
          context.pushAndRemoveUntilName(Routes.homeScreen);
        } else if (state is LoginLoading) {
          customLoadingIndicator(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
