import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/env/env.dart';
import '../widgets/book_new_botton.dart';
import '../widgets/contact_card.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.carDetails});
  final Value carDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          carDetails.model ?? '',
          style: AppTextStyles.font28BoldBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.r),
                      bottomRight: Radius.circular(100.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'carImage',
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl:
                              carDetails.images != null &&
                                      carDetails.images!.isNotEmpty
                                  ? '${Env.baseUrl}${carDetails.images!.first.filePath}'
                                  : "https://www.pngmart.com/files/22/Car-Logo-PNG-HD-Isolated.png",

                          height: 150.h,

                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${carDetails.pricePerDay} /',
                              style: AppTextStyles.font28BoldBlack,
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
                ),
                Positioned(bottom: -30.h, child: BookNowButton()),
              ],
            ),
            verticalSpace(34),

            verticalSpace(16),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                Text(
                  'Overview'.tr(context: context),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.03,
                  ),
                ),
                SizedBox(
                  width: 339.w,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: carDetails.description,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 204),
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),

                Text(
                  'Renter Details'.tr(context: context),
                  style: AppTextStyles.font28BoldWhite,
                ),
                verticalSpace(16),
                ContactCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
