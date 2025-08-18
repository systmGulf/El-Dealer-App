import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/features/home/presentation/view/controller/car_cubit/car_cubit.dart';
import 'package:eldealer/features/home/presentation/view/controller/saved_cars_cubit/saved_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/image_not_found_widget.dart';

class CarForRentwidget extends StatelessWidget {
  const CarForRentwidget({
    super.key,
    required this.carName,
    required this.pricePerDay,
    this.image,
    required this.onTap,
    required this.carId,
  });
  final String carName;
  final String pricePerDay;
  final String? image;
  final VoidCallback onTap;
  final int carId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFAFB),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  image ??
                  "https://www.pngmart.com/files/22/Car-Logo-PNG-HD-Isolated.png",
              height: 150.h,

              errorWidget: (context, url, error) => ImageNotFoundWidget(),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    carName,
                    style: AppTextStyles.font24BoldBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: pricePerDay,
                        style: AppTextStyles.font24BoldBlack.copyWith(
                          color: Colors.black.withValues(alpha: 166),
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: AppTextStyles.font24BoldBlack.copyWith(
                          color: Colors.black.withValues(alpha: 166),
                        ),
                      ),
                      TextSpan(
                        text: 'Day'.tr(context: context),
                        style: AppTextStyles.font16RegularBlack,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.orange.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 1,
                    children: [
                      Text(
                        'View Details'.tr(context: context),
                        style: AppTextStyles.font14MediumRed.copyWith(
                          color: const Color.fromARGB(255, 231, 180, 13),
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),
                context.read<SavedCarsCubit>().cars != null &&
                        context
                            .read<SavedCarsCubit>()
                            .cars!
                            .value!
                            .isNotEmpty &&
                        context.read<SavedCarsCubit>().cars!.value!.any(
                          (element) => element.id == carId,
                        )
                    ? Icon(Icons.check, color: Colors.green, size: 24.h)
                    : GestureDetector(
                      onTap: () async {
                        context.read<SavedCarsCubit>().saveCar(
                          carId: carId.toString(),
                        );
                      },
                      child: Image.asset(
                        'assets/images/save_icon.png',
                        height: 24.h,
                      ),
                    ),

                horizontalSpace(8),
                GestureDetector(
                  onTap: () {
                    context.pushName(Routes.rentScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: AppColors.orangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'Rent'.tr(context: context),
                          style: AppTextStyles.font14MediumWhite,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
