import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/model/login_response.dart';
import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';
import 'package:eldealer/features/auth/data/model/sign_up_response.dart';

import '../model/user_data_response.dart';

abstract class AuthRepo {
  // login
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  });
  // signUp
  Future<Either<Failure, SignUpResponse>> signUp({
    required SignUpRequestBody signUpRequestBody,
  });

  // get Current User
  Future<Either<Failure, UserDataResponse>> getCurrentUser();
}
