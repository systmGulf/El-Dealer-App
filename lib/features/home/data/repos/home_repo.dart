import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/home/data/models/brand_response_model.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:eldealer/features/home/data/models/rent_car_request_body.dart';

import '../models/saved_car_response_model.dart';

abstract class HomeRepo {
  // Get all cars
  Future<Either<Failure, CarsResponseModel>> getAllCars();

  // Get saved cars
  Future<Either<Failure, SavedCarResponseModel>> getSavedCars();
  // Get brands
  Future<Either<Failure, BrandResponseModel>> getBrands();
  // Save car
  Future<Either<Failure, void>> saveCar({required String carId});
  // Delete car
  Future<Either<Failure, void>> deleteCar({required int carId});
  // Rent car
  Future<Either<Failure, void>> rentCar({
    required RentCarRequestBody rentCarRequestBody,
  });
}
