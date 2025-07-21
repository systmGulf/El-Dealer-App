import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);
  @override
  Future<Either<Failure, void>> login({
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
        return const Right(null);
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      await _apiService.post(
        endPoint: ApiConstant.signUpEndPoint,
        body: signUpRequestBody.toJson(),
      );
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
