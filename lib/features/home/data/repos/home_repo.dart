import 'package:dartz/dartz.dart';
import 'package:eldealer/core/errors/error_handler.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CarsResponseModel>> getAllCars();
}
