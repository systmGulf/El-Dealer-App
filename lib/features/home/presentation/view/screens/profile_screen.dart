import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/app_spaces.dart';
import '../widgets/car_in_history_widget.dart';
import '../widgets/settings_item_widget.dart';
import '../widgets/user_profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileCard(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'History',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.02,
                ),
              ),
            ),
            verticalSpace(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: const CarInHistoryWidget(),
                  ),
                ),
              ),
            ),
            verticalSpace(26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Profile Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.02,
                ),
              ),
            ),
            verticalSpace(16),
            SettingsItemWidget(
              title: 'Account Settings',
              leadingIcon: Icon(Icons.person_2_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Dark mode',
              leadingIcon: Icon(Icons.light_sharp, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Card Details',
              leadingIcon: Icon(Icons.credit_card, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Car Preferences',
              leadingIcon: Icon(Icons.car_crash_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Offers and Discounts',
              leadingIcon: Icon(Icons.gif_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
