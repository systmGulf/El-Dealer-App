import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/styles/app_text_styles.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Smith', style: AppTextStyles.font16RegularWhite),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  horizontalSpace(8),
                  Text(
                    'Chennai Central, Suburban',
                    style: AppTextStyles.font12SatoshiRegularWithOpacity,
                  ),
                ],
              ),
            ],
          ),
          horizontalSpace(32),
          CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0x19339989),
            child: SvgPicture.asset('assets/svgs/telephone_icon.svg'),
          ),

          CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0x19339989),
            child: SvgPicture.asset('assets/svgs/location_icon.svg'),
          ),
        ],
      ),
    );
  }
}
