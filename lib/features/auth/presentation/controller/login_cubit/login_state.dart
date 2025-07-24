part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class GetCurrentUserSuccess extends LoginState {}

final class GetCurrentUserLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  final UserDataResponse userDataResponse;

  const LoginSuccess( {required this.loginResponse, required this.userDataResponse});
}

final class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}
