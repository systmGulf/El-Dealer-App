import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildChangeLanguageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: AppColors.scaffoldColor,
    context: context,
    builder: (cnx) {
      return IntrinsicHeight(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                onTap: () {
                  context.setLocale(const Locale('en', 'US'));
                  Navigator.pop(context);
                },
                title: Text(
                  'English',
                  style: AppTextStyles.font20MontserratBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                onTap: () {
                  context.setLocale(const Locale('ar', 'AE'));
                  Navigator.pop(context);
                },
                title: Text(
                  'العربية',

                  style: AppTextStyles.font20MontserratBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),

              verticalSpace(20),
            ],
          ),
        ),
      );
    },
  );
}
