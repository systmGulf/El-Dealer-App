part of 'saved_cars_cubit.dart';

sealed class SavedCarsState extends Equatable {
  const SavedCarsState();

  @override
  List<Object> get props => [];
}

final class SavedCarsInitial extends SavedCarsState {}

final class GetSavedCarsLoading extends SavedCarsState {}

final class GetSavedCarsSuccess extends SavedCarsState {
  final CarsResponseModel carsResponseModel;

  const GetSavedCarsSuccess({required this.carsResponseModel});
  @override
  List<Object> get props => [carsResponseModel];
}

final class GetSavedCarsFailure extends SavedCarsState {
  final String errorMsg;

  const GetSavedCarsFailure({required this.errorMsg});
}
