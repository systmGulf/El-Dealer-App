import 'package:bloc/bloc.dart';
import 'package:eldealer/features/home/data/models/rent_car_request_body.dart';
import 'package:eldealer/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'rent_car_state.dart';

class RentCarCubit extends Cubit<RentCarState> {
  final HomeRepo homeRepo;
  RentCarCubit(this.homeRepo) : super(RentCarInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String startData = '';
  String endData = '';
  int carId = 0;
  // rent car method
  Future<void> rentCar() async {
    emit(RentCarLoading());
    var result = await homeRepo.rentCar(
      rentCarRequestBody: RentCarRequestBody(
        startDateTime: startData,
        endDateTime: endData,
        fullName: nameController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        carId: carId,
      ),
    );
    result.fold((failure) => emit(RentCarError(errorMsg: failure.errorMsg)), (
      carsResponseModel,
    ) {
      emit(RentCarSuccess());
    });
  }
}
