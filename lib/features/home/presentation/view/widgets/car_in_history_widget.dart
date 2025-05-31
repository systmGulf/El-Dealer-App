import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInHistoryWidget extends StatelessWidget {
  const CarInHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF898989),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              '21 Sep, 23',
              style: AppTextStyles.font12SatoshiRegular,
            ),
          ),
          Image.asset('assets/images/dummy_car_2.png', height: 100.h),
          Text('BENZ THUNDER', style: AppTextStyles.font12SatoshiRegular),
        ],
      ),
    );
  }
}
