part of 'car_cubit.dart';

sealed class CarState extends Equatable {
  const CarState();

  @override
  List<Object> get props => [];
}

final class CarInitial extends CarState {}

final class GetAllCarsLoading extends CarState {}

final class GetAllCarsSuccess extends CarState {
  final CarsResponseModel carsResponseModel;

  const GetAllCarsSuccess({required this.carsResponseModel});
}

final class GetAllCarsFailure extends CarState {
  final String errorMsg;

  const GetAllCarsFailure({required this.errorMsg});
}
