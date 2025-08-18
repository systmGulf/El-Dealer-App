import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/styles/app_text_styles.dart';
import '../controller/brand_cubit/brand_cubit.dart';
import '../controller/brand_cubit/brand_state.dart';
import 'categories_container.dart';

class BrandBannerBlodBuilder extends StatefulWidget {
  const BrandBannerBlodBuilder({super.key});

  @override
  State<BrandBannerBlodBuilder> createState() => _BrandBannerBlodBuilderState();
}

class _BrandBannerBlodBuilderState extends State<BrandBannerBlodBuilder> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      buildWhen:
          (previous, current) =>
              current is GetBrandsError ||
              current is GetBrandsSuccess ||
              current is GetBrandsLoading,
      builder: (context, state) {
        if (state is GetBrandsLoading) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Skeletonizer(
                    child: Container(
                      width: 88.w,
                      height: 56.h,
                      padding: const EdgeInsets.all(2.46),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF252422),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetBrandsSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.brandResponseModel.value?.length ?? 0,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (index == 0) {
                        context.read<BrandCubit>().selectBrand(null, 0);
                      } else {
                        final brandName =
                            state.brandResponseModel.value?[index].name;
                        context.read<BrandCubit>().selectBrand(
                          brandName,
                          index,
                        );
                      }
                    },
                    child:
                        index == 0
                            ? Container(
                              width: 88.w,
                              height: 56.h,
                              padding: const EdgeInsets.all(2.46),
                              decoration: ShapeDecoration(
                                color:
                                    index != selectedIndex
                                        ? const Color(0xFF252422)
                                        : AppColors.orangeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "All".tr(context: context),
                                  style: AppTextStyles.font18MediumWhite,
                                ),
                              ),
                            )
                            : CategoriesContainer(
                              brandResponseModel:
                                  state.brandResponseModel.value![index],
                              index: index,
                              selectedIndex: selectedIndex,
                            ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetBrandsError) {
          return Center(child: Text(state.errorMsg));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
