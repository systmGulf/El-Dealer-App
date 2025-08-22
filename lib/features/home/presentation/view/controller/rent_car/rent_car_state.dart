part of 'rent_car_cubit.dart';

abstract class RentCarState extends Equatable {
  const RentCarState();

  @override
  List<Object> get props => [];
}

class RentCarInitial extends RentCarState {}

class RentCarLoading extends RentCarState {}

class RentCarSuccess extends RentCarState {}

class RentCarError extends RentCarState {
  final String errorMsg;

  const RentCarError({required this.errorMsg});
}
