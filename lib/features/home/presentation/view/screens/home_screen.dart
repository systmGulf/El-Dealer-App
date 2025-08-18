import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/network/api_constant.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/features/home/presentation/view/controller/car_cubit/car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/brand_cubit/brand_cubit.dart';
import '../widgets/brand_banner_bloc_builder.dart';
import '../widgets/get_cars_bloc_builder.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/home_bg_image.png', fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: RefreshIndicator(
            color: Colors.white,
            onRefresh: () async {
              context.read<BrandCubit>().getBrands();
              context.read<CarCubit>().getAllCars();
            },
            child: ListView(
              children: [
                HomeAppBar(),

                Text(
                  'Welcome back!'.tr(context: context),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 128),
                    fontSize: 14.sp,
                    fontFamily: 'General Sans',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                  ),
                ),

                Text(
                  ApiConstant.userName.tr(context: context),
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontSize: 18.sp,
                    fontFamily: 'General Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.02,
                  ),
                ),
                verticalSpace(18),

                Text(
                  'Select Cars for rent'.tr(context: context),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'General Sans',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                  ),
                ),
                verticalSpace(16),
                BrandBannerBlodBuilder(),
                verticalSpace(16),
                GetCarBlocBuilder(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
