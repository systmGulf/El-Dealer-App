import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/env/env.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/image_not_found_widget.dart';
import '../widgets/book_new_botton.dart';
import '../widgets/contact_card.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, required this.carDetails});
  final Items carDetails;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  int currentIndex = 0;
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
          (widget.carDetails.brand?.name ?? '') +
              ' ' +
              (widget.carDetails.model?.name ?? ''),
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
                  height: 310.h,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 200.h,

                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            controller: PageController(initialPage: 0),
                            itemCount: widget.carDetails.images?.length ?? 0,
                            itemBuilder: (context, index) {
                              return widget.carDetails.images?.length == 0
                                  ? Text(
                                    'No image'.tr(context: context),
                                    style: AppTextStyles.font12SatoshiRegular
                                        .copyWith(
                                          color: Colors.black.withValues(
                                            alpha: 166,
                                          ),
                                        ),
                                  )
                                  : CachedNetworkImage(
                                    imageUrl:
                                        '${Env.baseUrl}${widget.carDetails.images![index]}',
                                    height: 200.h,
                                    errorWidget:
                                        (context, url, error) =>
                                            ImageNotFoundWidget(),
                                    fit: BoxFit.fill,
                                  );
                            },
                          ),
                        ),
                      ),
                      verticalSpace(8),
                      DotsIndicator(
                        dotsCount:
                            widget.carDetails.images?.length == 0
                                ? 1
                                : widget.carDetails.images?.length ?? 0,
                        position: currentIndex.toDouble(),
                      ),
                      verticalSpace(5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${widget.carDetails.price} /',
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
                Positioned(
                  bottom: -33.h,
                  child: GestureDetector(
                    onTap: () {
                      context.pushName(Routes.rentScreen);
                    },
                    child: BookNowButton(),
                  ),
                ),
              ],
            ),
            verticalSpace(34),

            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14,
                children: [
                  Text(
                    'Overview'.tr(context: context),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
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
                            text: widget.carDetails.description,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 204),
                              fontSize: 14.sp,
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
                    'Cars Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                      letterSpacing: 0.08,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/profile.svg',
                            color: Colors.orange,
                          ),
                          horizontalSpace(8),
                          Text(
                            '${widget.carDetails.seats} Seat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 1.33,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ],
                      ),
                    
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/profile.svg",
                            color: Colors.orange,
                          ),
                          horizontalSpace(8),
                          Text(
                            'Fuel into : ${widget.carDetails.fuel?.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 1.33,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFF3F4F6),
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Top Speed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 1.33,
                            letterSpacing: 0.06,
                          ),
                        ),
                        Text(
                          '200',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                            letterSpacing: 0.07,
                          ),
                        ),
                        Text(
                          'mph',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 1.33,
                            letterSpacing: 0.06,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
