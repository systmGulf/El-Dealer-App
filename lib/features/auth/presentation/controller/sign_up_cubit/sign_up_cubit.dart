import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  // Text editing controllers to get user input
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  // Cubit sign up handeler
  Future<void> doSignUp() async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(
      signUpRequestBody: SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    result.fold(
      (l) => emit(SignUpFailure(errorMsg: l.errorMsg)),
      (r) => emit(SignUpSuccess()),
    );
  }
}
