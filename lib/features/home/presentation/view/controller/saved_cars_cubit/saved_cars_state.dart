part of 'saved_cars_cubit.dart';

sealed class SavedCarsState extends Equatable {
  const SavedCarsState();

  @override
  List<Object> get props => [];
}

final class SavedCarsInitial extends SavedCarsState {}

final class GetSavedCarsLoading extends SavedCarsState {}

final class GetSavedCarsSuccess extends SavedCarsState {
  final SavedCarResponseModel savedCarModel;

  const GetSavedCarsSuccess({required this.savedCarModel});
  @override
  List<Object> get props => [savedCarModel];
}

final class GetSavedCarsFailure extends SavedCarsState {
  final String errorMsg;

  const GetSavedCarsFailure({required this.errorMsg});
}

final class SaveCarLoading extends SavedCarsState {}

final class SaveCarSuccess extends SavedCarsState {}

final class SaveCarFailure extends SavedCarsState {
  final String errorMsg;

  const SaveCarFailure({required this.errorMsg});
}

final class DeleteSavedCarLoading extends SavedCarsState {}

final class DeleteSavedCarSuccess extends SavedCarsState {}

final class DeleteSavedCarFailure extends SavedCarsState {
  final String errorMsg;

  const DeleteSavedCarFailure({required this.errorMsg});
}
