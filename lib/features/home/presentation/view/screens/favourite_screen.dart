import 'package:eldealer/features/home/presentation/view/controller/saved_cars_cubit/saved_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/env/env.dart';
import '../widgets/car_in_favourite_widget.dart';
import '../widgets/saved_car_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Align(alignment: Alignment.centerLeft, child: SavedCarWidget()),
            verticalSpace(16),
            BlocBuilder<SavedCarsCubit, SavedCarsState>(
              buildWhen:
                  (previous, current) =>
                      current is GetSavedCarsSuccess ||
                      current is GetSavedCarsLoading ||
                      current is GetSavedCarsFailure,
              builder: (context, state) {
                if (state is GetSavedCarsLoading) {
                  return Skeletonizer(
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CarInFavouriteWidget(
                            carId: 0,
                            carName: 'dumyy',
                            carImage: null,
                            pricePerDay: 'dumyy',
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is GetSavedCarsSuccess) {
                  return Column(
                    children: List.generate(
                      state.savedCarModel.value?.length ?? 0,

                      (index) => CarInFavouriteWidget(
                        carId: state.savedCarModel.value![index].id! ,
                        carName:
                            state.savedCarModel.value![index].modelId
                                .toString() ??
                            '',

                        carImage:
                            '${Env.baseUrl}${state.savedCarModel.value![index].thumbnailImage}',
                        pricePerDay: '1--',
                      ),
                    ),
                  );
                } else if (state is GetSavedCarsFailure) {
                  return Center(child: Text(state.errorMsg));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
