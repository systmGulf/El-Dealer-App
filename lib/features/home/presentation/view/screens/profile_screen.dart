import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/network/secure_cache.dart';
import 'package:eldealer/features/home/presentation/view/widgets/alart_bottom_sheet_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_spaces.dart';
import '../../../../../core/common/change_language_method.dart';
import '../../../../../core/routing/routes.dart';
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
                'History'.tr(context: context),
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
                'Profile Settings'.tr(context: context),
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
              title: 'Account Settings'.tr(context: context),
              leadingIcon: Icon(Icons.person_2_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              onTap: () => buildChangeLanguageBottomSheet(context),
              title: 'Language'.tr(context: context),
              leadingIcon: Icon(Icons.language, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),

            SettingsItemWidget(
              title: 'Car Preferences'.tr(context: context),
              leadingIcon: Icon(Icons.car_crash_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Offers and Discounts'.tr(context: context),
              leadingIcon: Icon(Icons.gif_outlined, color: Colors.white),
              trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            SettingsItemWidget(
              title: 'Logout'.tr(context: context),
              leadingIcon: Icon(Icons.logout, color: Colors.white),
              trailingIcon: SizedBox.shrink(),

              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => AlartBottomSheetDialog(
                        title: 'Logout',
                        subTitle:
                            'Securely log out of your account—come back anytime!',
                        onTap: () {
                          SecureCache.deleteFromCache().then(
                            (value) => context.pushAndRemoveUntilName(
                              Routes.loginScreen,
                            ),
                          );
                        },
                        textButton: 'Logout'.tr(context: context),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
