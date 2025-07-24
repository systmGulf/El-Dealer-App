import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/model/login_response.dart';
import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  // Login call Api from Api Service
  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final result = await _apiService.post(
        endPoint: ApiConstant.loginEndPoint,
        body: loginRequestBody.toJson(),
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(LoginResponse.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  // SignUp call Api from Api Service
  @override
  Future<Either<Failure, void>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final result = await _apiService.post(
        endPoint: ApiConstant.signUpEndPoint,
        body: signUpRequestBody.toJson(),
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? const Right(null)
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
