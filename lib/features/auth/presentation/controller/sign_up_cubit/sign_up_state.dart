part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponse;

  const SignUpSuccess({required this.signUpResponse});
}

final class SignUpFailure extends SignUpState {
  final String errorMsg;

  const SignUpFailure({required this.errorMsg});
}
