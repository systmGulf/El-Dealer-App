import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';

class CarInFavouriteWidget extends StatelessWidget {
  const CarInFavouriteWidget({super.key});

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
          Image.asset('assets/images/dummy_car_2.png'),

          Divider(color: Colors.black.withValues(alpha: 217), thickness: 0.5),
          Row(
            children: [
              Text(
                'Benz Thunder R',
                style: AppTextStyles.font24BoldBlackWithOpacity,
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    '\$520',
                    style: AppTextStyles.font24BoldBlack.copyWith(
                      color: Colors.black.withValues(alpha: 217),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.font16RegularBlackWithOpacity,
                        ),
                        TextSpan(
                          text: 'Day',
                          style: AppTextStyles.font16RegularBlackWithOpacity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0x26EB5E28),
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
                      'View Details',
                      style: AppTextStyles.font14MediumRedWithOpacity,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
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
                      'Rent',
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
            ],
          ),
        ],
      ),
    );
  }
}
