import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/env/env.dart';
import 'package:eldealer/features/home/presentation/view/controller/brand_cubit/brand_cubit.dart';
import 'package:eldealer/features/home/presentation/view/widgets/car_for_rent_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/routing/routes.dart';
import '../controller/brand_cubit/brand_state.dart';
import '../controller/car_cubit/car_cubit.dart';

class GetCarBlocBuilder extends StatefulWidget {
  const GetCarBlocBuilder({super.key});

  @override
  State<GetCarBlocBuilder> createState() => _GetCarBlocBuilderState();
}

class _GetCarBlocBuilderState extends State<GetCarBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCubit, CarState>(
      buildWhen:
          (previous, current) =>
              current is GetAllCarsFailure ||
              current is GetAllCarsSuccess ||
              current is GetAllCarsLoading ||
              current != previous,
      builder: (context, state) {
        if (state is GetAllCarsLoading) {
          return Skeletonizer(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CarForRentWidget(
                      carId: 0,
                      onTap: () {},
                      carName: 'Car du',
                      pricePerDay: " 19029",
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetAllCarsSuccess) {
          final allCars = state.carsResponseModel.value?.items ?? [];

          final brandState = context.watch<BrandCubit>().state;
          String? selectedBrand;
          if (brandState is BrandSelected) {
            selectedBrand = brandState.brandName;
          }

          final filteredCars =
              selectedBrand == null
                  ? allCars
                  : allCars
                      .where(
                        (car) =>
                            car.brand?.name?.toLowerCase() ==
                            selectedBrand!.toLowerCase(),
                      )
                      .toList();

          return filteredCars.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'No Cars Found'.tr(context: context),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  final car = filteredCars[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CarForRentWidget(
                      carId: car.id!.toInt(),
                      onTap: () {
                        context.pushName(
                          Routes.carDetailsScreen,
                          arguments: car,
                        );
                      },
                      image: '${Env.baseUrl}${car.thumbnailImage}',
                      carName:
                          '${car.brand?.name ?? ''} ${car.model?.name ?? ''}',
                      pricePerDay: car.price?.toString() ?? '',
                    ),
                  );
                },
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
