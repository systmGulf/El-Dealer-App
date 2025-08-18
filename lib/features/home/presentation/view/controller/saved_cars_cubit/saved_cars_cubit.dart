import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/car_response_model.dart';
import '../../../../data/models/saved_car_response_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'saved_cars_state.dart';

class SavedCarsCubit extends Cubit<SavedCarsState> {
  final HomeRepo homeRepo;
  SavedCarsCubit(this.homeRepo) : super(SavedCarsInitial());
  SavedCarResponseModel? cars;
  // get saved cars Method
  Future<void> getSavedCars() async {
    emit(GetSavedCarsLoading());
    var result = await homeRepo.getSavedCars();
    result.fold(
      (failure) => emit(GetSavedCarsFailure(errorMsg: failure.errorMsg)),
      (carsResponseModel) {
        cars = carsResponseModel;
        print("saved caraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaas $cars");

        emit(GetSavedCarsSuccess(savedCarModel: carsResponseModel));
      },
    );
  }

  // save car
  Future<void> saveCar({required String carId}) async {
    emit(SaveCarLoading());
    var result = await homeRepo.saveCar(carId: carId);
    result.fold((failure) => emit(SaveCarFailure(errorMsg: failure.errorMsg)), (
      carsResponseModel,
    ) {
      getSavedCars();
      emit(SaveCarSuccess());
    });
  }
  // delete saved car

  Future<void> deleteCar({required int carId}) async {
    emit(DeleteSavedCarLoading());
    var result = await homeRepo.deleteCar(carId: carId);
    result.fold(
      (failure) => emit(DeleteSavedCarFailure(errorMsg: failure.errorMsg)),
      (carsResponseModel) {
        getSavedCars();
        emit(DeleteSavedCarSuccess());
      },
    );
  }
}
