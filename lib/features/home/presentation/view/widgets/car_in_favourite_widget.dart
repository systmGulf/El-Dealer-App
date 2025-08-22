import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/core/widgets/image_not_found_widget.dart';
import 'package:eldealer/features/home/presentation/view/controller/saved_cars_cubit/saved_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/routing/routes.dart';

class CarInFavouriteWidget extends StatelessWidget {
  const CarInFavouriteWidget({
    super.key,
    required this.carName,
    required this.carImage,
    required this.pricePerDay, required this.carId,
  });
  final String carName;
  final String? carImage;
  final String pricePerDay;
  final int carId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),

      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFAFB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
                carImage ??
                "https://www.pngmart.com/files/22/Car-Logo-PNG-HD-Isolated.png",
            height: 150.h,
            errorWidget: (context, url, error) => ImageNotFoundWidget(),
          ),

          Divider(color: Colors.black.withValues(alpha: 217), thickness: 0.5),
          verticalSpace(16),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<SavedCarsCubit>().deleteCar(carId: carId);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.red,
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
                        'Delete'.tr(context: context),
                        style: AppTextStyles.font14MediumRedWithOpacity
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
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
                    color: const Color(0xFFEB5E28),
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
                        style: AppTextStyles.font14MediumWhiteWithOpacity,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
