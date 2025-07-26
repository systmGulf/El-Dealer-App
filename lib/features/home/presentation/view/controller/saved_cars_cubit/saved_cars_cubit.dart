import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/car_response_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'saved_cars_state.dart';

class SavedCarsCubit extends Cubit<SavedCarsState> {
  final HomeRepo homeRepo;
  SavedCarsCubit(this.homeRepo) : super(SavedCarsInitial());
  // get saved cars Method
  Future<void> getSavedCars() async {
    emit(GetSavedCarsLoading());
    var result = await homeRepo.getSavedCars();
    result.fold(
      (failure) => emit(GetSavedCarsFailure(errorMsg: failure.errorMsg)),
      (carsResponseModel) =>
          emit(GetSavedCarsSuccess(carsResponseModel: carsResponseModel)),
    );
  }
}
