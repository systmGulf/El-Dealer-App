import 'package:eldealer/core/network/api_service.dart';
import 'package:eldealer/core/network/dio_factory.dart';
import 'package:eldealer/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:eldealer/features/auth/data/repos/auth_repo_impl.dart';
import 'package:eldealer/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:eldealer/features/home/presentation/view/controller/brand_cubit/brand_cubit.dart';
import 'package:eldealer/features/home/presentation/view/controller/saved_cars_cubit/saved_cars_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view/controller/car_cubit/car_cubit.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  // register api service class and inject dio instance
  getIt.registerLazySingleton(() => ApiService(dio: DioFactory.getDio()));

  // register auth repo class and inject api service instance
  getIt
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(apiService: getIt<ApiService>()),
    )
    ..registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(apiService: getIt<ApiService>()),
    );

  // cubits
  getIt
    ..registerFactory<SignUpCubit>(
      () => SignUpCubit(authRepo: getIt<AuthRepo>()),
    )
    ..registerFactory<LoginCubit>(() => LoginCubit(authRepo: getIt<AuthRepo>()))
    ..registerFactory<CarCubit>(() => CarCubit(homeRepo: getIt<HomeRepo>()))
    ..registerFactory(() => SavedCarsCubit(getIt<HomeRepo>()))
    ..registerFactory(() => BrandCubit(getIt<HomeRepo>()));
}
