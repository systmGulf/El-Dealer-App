import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/routing/routes.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/styles/app_text_styles.dart';
import 'package:eldealer/features/on_boarding/presentation/view/widgets/get_start_button.dart';
import 'package:flutter/material.dart';

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
            top: MediaQuery.of(context).size.height * 0.4,

            child: Text(
              "El-Dealer",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: GestureDetector(
              onTap: () => context.pushName(Routes.homeScreen),
              child: GetStartButton(),
            ),
          ),
        ],
      ),
    );
  }
}
