import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/core/network/api_service.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:eldealer/features/home/data/repos/home_repo.dart';

import '../../../../core/network/api_constant.dart';

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
}
