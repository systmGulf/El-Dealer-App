import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:eldealer/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final HomeRepo homeRepo;
  CarCubit({required this.homeRepo}) : super(CarInitial());

  CarsResponseModel? carsResponseModel;
  Future<void> getAllCars() async {
    emit(GetAllCarsLoading());
    var result = await homeRepo.getAllCars();
    result.fold(
      (failure) => emit(GetAllCarsFailure(errorMsg: failure.errorMsg)),
      (carsResponseModel) =>
          emit(GetAllCarsSuccess(carsResponseModel: carsResponseModel)),
    );
  }
}
