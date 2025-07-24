import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/network/api_constant.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_spaces.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: ShapeDecoration(
        color: Color(0xff202223),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          horizontalSpace(16),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ApiConstant.userName.tr(context: context),
                textAlign: TextAlign.center,
                style: AppTextStyles.font24MediumWhite,
              ),
              Text(
                'Joined Feb 15, 2025'.tr(context: context),
                textAlign: TextAlign.center,
                style: AppTextStyles.font16RegularWhite,
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              SvgPicture.asset(
                'assets/svgs/settings_icon.svg',
                color: Colors.white,
              ),
              verticalSpace(8),
              SvgPicture.asset(
                'assets/svgs/edit_icon.svg',
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
