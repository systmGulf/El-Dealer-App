import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/routing/routes.dart';

class CarForRentwidget extends StatelessWidget {
  const CarForRentwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(Routes.carDetailsScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFAFB),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          children: [
            Image.asset('assets/images/dummy_car.png'),
            Divider(),
            Row(
              children: [
                Text(
                  'Ferrari 280 Special'.tr(context: context),
                  style: AppTextStyles.font24BoldBlack,
                ),
                Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '250'.tr(context: context),
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
                        'View Details'.tr(context: context),
                        style: AppTextStyles.font14MediumRed,
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
                        '#Trend Car'.tr(context: context),
                        style: AppTextStyles.font14MediumRed,
                      ),
                    ],
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
