import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../widgets/book_new_botton.dart';
import '../widgets/contact_card.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

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
          'Ferrari 280 Special'.tr(context: context),
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
                      Image.asset('assets/images/dummy_car.png'),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$450 /',
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
                          text:
                              'Lorem ipsum dolor sit amet consectetur. Fermentum morbi proin sed tortor augue sed neque. Id praesent sit posuere diam orci vivamus sapien velit neque. Sollicitudin ut convallis amet eget. Gravida egestas at turpis faucibus gravida'
                                  .tr(context: context),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 204),
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                        TextSpan(
                          text: 'Read more...'.tr(context: context),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.02,
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
