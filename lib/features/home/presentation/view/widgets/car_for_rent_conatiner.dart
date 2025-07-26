import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/routing/routes.dart';

class CarForRentwidget extends StatelessWidget {
  const CarForRentwidget({
    super.key,
    required this.carName,
    required this.pricePerDay,
    this.image, required this.onTap,
  });
  final String carName;
  final String pricePerDay;
  final String? image;
  final VoidCallback onTap;

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
              fit: BoxFit.fill,
              imageUrl:
                  image ??
                  "https://www.pngmart.com/files/22/Car-Logo-PNG-HD-Isolated.png",
              height: 150.h,

              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Divider(),
            Row(
              children: [
                Text(carName, style: AppTextStyles.font24BoldBlack),
                Spacer(),
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
