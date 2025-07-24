import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/common/custom_loading_indicator.dart';
import 'package:eldealer/core/network/api_constant.dart';
import 'package:eldealer/core/network/api_service.dart';
import 'package:eldealer/core/network/secure_cache.dart';
import 'package:eldealer/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is SignUpFailure ||
              current is SignUpSuccess ||
              current is SignUpLoading,
      listener: (context, state) async {
        if (state is SignUpFailure) {
          context.pop();
          DelightToastBar(
            autoDismiss: true,
            builder:
                (context) => ToastCard(
                  color: Colors.red,
                  leading: Icon(Icons.error_outline, size: 28),
                  title: Text(
                    state.errorMsg,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
        } else if (state is SignUpSuccess) {
          context.pop();
          SecureCache.insertToCache(
            key: 'token',
            value: state.signUpResponse.value?.token ?? '',
          );
          SecureCache.insertToCache(
            key: 'username',
            value: state.signUpResponse.value?.name ?? '',
          );

          ApiConstant.token = await SecureCache.getFromCache(key: 'token');
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
                    'your account has been created successfully'.tr(
                      context: context,
                    ),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
          context.pushName(Routes.homeScreen);
        } else if (state is SignUpLoading) {
          customLoadingIndicator(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
