import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login({
    required LoginRequestBody loginRequestBody,
  });
  Future<Either<Failure, void>> signUp({
    required SignUpRequestBody signUpRequestBody,
  });
}
