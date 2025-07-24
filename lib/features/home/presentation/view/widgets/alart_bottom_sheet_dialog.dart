import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_button.dart';

class AlartBottomSheetDialog extends StatelessWidget {
  const AlartBottomSheetDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.textButton,
    this.testFeild,
  });
  final String title, textButton;
  final String subTitle;
  final VoidCallback onTap;
  final Widget? testFeild;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Divider(indent: 177.w, endIndent: 177.w, thickness: 4),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x05000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font20Medium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: SizedBox(
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14Medium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            verticalSpace(16),
            testFeild ?? SizedBox.shrink(),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.scaffoldColor),
              child: Row(
                children: [
                  Expanded(
                    child: CustomAppButton(
                      buttonColor: Colors.black,

                      height: 59.h,
                      textButton: 'Cancel'.tr(context: context),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        height: 59.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              color: Color(0xFFDF2727),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            textButton,
                            style: AppTextStyles.font18SemiBold.copyWith(
                              color: Color(0xFFDF2727),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
