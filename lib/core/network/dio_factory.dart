import 'package:dio/dio.dart';
import 'package:eldealer/core/env/env.dart';
import 'package:eldealer/core/network/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      addDioHeaders();

      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.baseUrl = Env.baseUrl;

    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': '${ApiConstant.token}',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
