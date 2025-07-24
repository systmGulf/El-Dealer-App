import 'package:animate_do/animate_do.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/routing/routes.dart';

import 'package:eldealer/features/on_boarding/presentation/view/widgets/get_start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/on_boarding_bg_image.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,

            child: Image.asset(
              'assets/images/app_logo_without_bg.png',
              height: 350.h,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: GestureDetector(
              onTap: () => context.pushName(Routes.loginScreen),
              child: GetStartButton(),
            ),
          ),
        ],
      ),
    );
  }
}
