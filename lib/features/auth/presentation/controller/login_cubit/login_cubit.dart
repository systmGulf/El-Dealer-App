import 'package:eldealer/core/network/api_constant.dart';
import 'package:eldealer/features/auth/data/model/login_response.dart';
import 'package:eldealer/features/auth/data/model/user_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/network/secure_cache.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  // login Logic Handler
  Future<void> doLogin() async {
    emit(LoginLoading());
    var result = await authRepo.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((l) => emit(LoginError(message: l.errorMsg)), (
      loginResponse,
    ) async {
      await SecureCache.insertToCache(
        key: 'token',
        value: loginResponse.value?.token ?? '',
      );
      ApiConstant.token = await SecureCache.getFromCache(key: 'token');
      final result = await authRepo.getCurrentUser();
      result.fold(
        (l) => emit(LoginError(message: l.errorMsg)),
        (userDataResponse) => emit(
          LoginSuccess(
            loginResponse: loginResponse,
            userDataResponse: userDataResponse,
          ),
        ),
      );
    });
  }
}
