import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

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
    result.fold(
      (l) => emit(LoginError(message: l.errorMsg)),
      (r) => emit(LoginSuccess()),
    );
  }
}
