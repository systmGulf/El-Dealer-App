import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/auth/data/model/login_request_body.dart';
import 'package:eldealer/features/auth/data/model/login_response.dart';
import 'package:eldealer/features/auth/data/model/sign_up_request_body.dart';
import 'package:eldealer/features/auth/data/model/user_data_response.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo.dart';

import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_service.dart';
import '../model/sign_up_response.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl({required ApiService apiService}) : _apiService = apiService;

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
  Future<Either<Failure, SignUpResponse>> signUp({
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
            ? Right(SignUpResponse.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  // getCurrentUser call Api from Api Service
  @override
  Future<Either<Failure, UserDataResponse>> getCurrentUser() async {
    try {
      final result = await _apiService.get(
        endPoint: ApiConstant.getCurrentUserEndPoint,
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(UserDataResponse.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
