import 'package:bloc/bloc.dart';
import 'package:eldealer/features/home/data/models/brand_response_model.dart';
import 'package:eldealer/features/home/data/repos/home_repo.dart';
import 'package:eldealer/features/home/presentation/view/controller/brand_cubit/brand_state.dart';
import 'package:equatable/equatable.dart';

class BrandCubit extends Cubit<BrandState> {
  final HomeRepo homeRepo;
  BrandCubit(this.homeRepo) : super(BrandInitial());

  int selectedIndex = 0;
  BrandResponseModel? brandResponseModel;
  void selectBrand(String? brandName, int index) {
    selectedIndex = index;
    if (brandName == null) {
      emit(GetBrandsSuccess(brandResponseModel!));
    } else {
      emit(BrandSelected(brandName));
    }
  }

  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    var result = await homeRepo.getBrands();
    result.fold((failure) => emit(GetBrandsError(failure.errorMsg)), (
      brandResponseModel,
    ) {
      this.brandResponseModel = brandResponseModel;
      emit(GetBrandsSuccess(brandResponseModel));
    });
  }
}
