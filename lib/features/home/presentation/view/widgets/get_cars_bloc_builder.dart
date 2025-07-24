import 'package:eldealer/core/env/env.dart';
import 'package:eldealer/features/home/presentation/view/widgets/car_for_rent_conatiner.dart';
import 'package:envied/envied.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controller/car_model/car_cubit.dart';

class GetCarBlocBuilder extends StatelessWidget {
  const GetCarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCubit, CarState>(
      buildWhen:
          (previous, current) =>
              current is GetAllCarsFailure ||
              current is GetAllCarsSuccess ||
              current is GetAllCarsLoading,
      builder: (context, state) {
        if (state is GetAllCarsLoading) {
          return Skeletonizer(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CarForRentwidget(
                      carName: 'Car du',
                      pricePerDay: " 19029",
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetAllCarsSuccess) {
          return Hero(
            tag: 'carImage',
            transitionOnUserGestures: true,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state.carsResponseModel.value?.length ?? 0,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CarForRentwidget(
                      image:
                          (state.carsResponseModel.value?[index].images !=
                                      null &&
                                  state
                                      .carsResponseModel
                                      .value![index]
                                      .images!
                                      .isNotEmpty)
                              ? '${Env.baseUrl}${state.carsResponseModel.value![index].images!.first.filePath}'
                              : null,
                      carName:
                          state.carsResponseModel.value?[index].model ?? '',
                      pricePerDay:
                          state.carsResponseModel.value?[index].pricePerDay
                              ?.toString() ??
                          '',
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetAllCarsFailure) {
          return Center(child: Text(state.errorMsg));
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
