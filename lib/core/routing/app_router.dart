import 'package:eldealer/core/dependacy_injection/get_it.dart';
import 'package:eldealer/core/routing/routes.dart';
import 'package:eldealer/core/screens/no_route_screen.dart';
import 'package:eldealer/features/auth/controller/cubit/login_cubit.dart';
import 'package:eldealer/features/auth/presentation/view/screens/login_screen.dart';
import 'package:eldealer/features/auth/presentation/view/screens/sign_up_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/car_details_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/layout_screen.dart';
import 'package:eldealer/features/home/presentation/view/screens/rent_screen.dart';
import 'package:eldealer/features/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(builder: (_) => const CarDetailsScreen());
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
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // rent Screen
      case Routes.rentScreen:
        return MaterialPageRoute(builder: (_) => const RentScreen());
      default:
        // this is the default route
        return MaterialPageRoute(builder: (_) => const NoRouteScreen());
    }
  }
}
