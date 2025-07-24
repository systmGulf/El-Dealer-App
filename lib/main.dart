import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_bloc_observer.dart';
import 'package:eldealer/core/dependacy_injection/get_it.dart';
import 'package:eldealer/core/network/secure_cache.dart';
import 'package:eldealer/core/routing/routes.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/network/api_constant.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // token
  ApiConstant.token = await SecureCache.getFromCache(key: 'token');
  // username
  ApiConstant.userName = await SecureCache.getFromCache(key: 'username');
  await EasyLocalization.ensureInitialized();
  setUpServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const Eldealer(),
    ),
  );
}

class Eldealer extends StatelessWidget {
  const Eldealer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute:
            ApiConstant.token == ''
                ? Routes.onBoardingScreen
                : Routes.homeScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
