import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/home/data/models/brand_response_model.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';

import '../models/saved_car_response_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CarsResponseModel>> getAllCars();
  Future<Either<Failure, SavedCarResponseModel>> getSavedCars();
  Future<Either<Failure, BrandResponseModel>> getBrands();
  Future<Either<Failure, void>> saveCar({required String carId});
  Future<Either<Failure, void>> deleteCar({required int carId});
}
