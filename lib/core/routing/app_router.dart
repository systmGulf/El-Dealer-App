import 'package:eldealer/core/dependacy_injection/get_it.dart';
import 'package:eldealer/core/routing/routes.dart';
import 'package:eldealer/core/screens/no_route_screen.dart';
import 'package:eldealer/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:eldealer/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:eldealer/features/auth/presentation/view/screens/login_screen.dart';
import 'package:eldealer/features/auth/presentation/view/screens/sign_up_screen.dart';
import 'package:eldealer/features/home/data/models/car_response_model.dart';
import 'package:eldealer/features/home/presentation/view/screens/car_details_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/layout_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/rent_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/on_boarding/presentation/view/on_boarding_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // On-boarding Screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      // Car Details Screen
      case Routes.carDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => CarDetailsScreen(
                carDetails: routeSettings.arguments as Items,
              ),
        );
      // login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      // sign up Screen
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen(),
              ),
        );
      // rent Screen
      case Routes.rentScreen:
        return MaterialPageRoute(builder: (_) => const RentScreen());
      default:
        // this is the default route
        return MaterialPageRoute(builder: (_) => const NoRouteScreen());
    }
  }
}
