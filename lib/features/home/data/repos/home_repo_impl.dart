import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/core/network/api_service.dart';
import 'package:eldealer/features/home/data/models/brand_response_model.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:eldealer/features/home/data/repos/home_repo.dart';

import '../../../../core/network/api_constant.dart';
import '../models/saved_car_response_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl({required ApiService apiService}) : _apiService = apiService;
  // get all cars called for api service
  @override
  Future<Either<Failure, CarsResponseModel>> getAllCars() async {
    try {
      final result = await _apiService.get(
        endPoint: ApiConstant.getAllCarsEndPoint,
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(CarsResponseModel.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  // get saved cars called for api service
  @override
  Future<Either<Failure, SavedCarResponseModel>> getSavedCars() async {
    try {
      final result = await _apiService.get(
        endPoint: ApiConstant.getSavedCarsEndPoint,
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(SavedCarResponseModel.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  // get brands called for api service
  @override
  Future<Either<Failure, BrandResponseModel>> getBrands() async {
    try {
      final result = await _apiService.get(
        endPoint: ApiConstant.getBrandsEndPoint,
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(BrandResponseModel.fromJson(result))
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> saveCar({required String carId}) async {
    try {
      final result = await _apiService.post(
        endPoint: ApiConstant.saveCarEndPoint,
        body: {'carId': carId},
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(null)
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCar({required int carId}) async {
    try {
      final result = await _apiService.delete(
        endPoint: "${ApiConstant.deleteCarEndPoint}/$carId",
      );
      if (result is ServerFailure) {
        return Left(ServerFailure(errorMsg: result.errorMsg));
      } else {
        return result['isSuccess']
            ? Right(null)
            : Left(ServerFailure(errorMsg: result['errors'][0]));
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
