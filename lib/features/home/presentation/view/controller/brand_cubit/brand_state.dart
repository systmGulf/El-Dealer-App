import 'package:equatable/equatable.dart';

import '../../../../data/models/brand_response_model.dart';

abstract class BrandState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BrandInitial extends BrandState {}

class GetBrandsLoading extends BrandState {}

class GetBrandsSuccess extends BrandState {
  final BrandResponseModel brandResponseModel;
  GetBrandsSuccess(this.brandResponseModel);
}

class GetBrandsError extends BrandState {
  final String errorMsg;
  GetBrandsError(this.errorMsg);
}

class BrandSelected extends BrandState {
  final String? brandName;
  BrandSelected(this.brandName);

  @override
  List<Object?> get props => [brandName];
}
