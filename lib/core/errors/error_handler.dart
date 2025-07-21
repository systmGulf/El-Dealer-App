import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class Failure {
  Failure({required this.errorMsg});
  final String errorMsg;
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMsg});
  factory ServerFailure.formDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMsg: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMsg: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMsg: 'Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMsg: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResonse(response: exception.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errorMsg: 'Cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMsg: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(errorMsg: 'There was an error');
    }
  }
  factory ServerFailure.fromResonse({required Response<dynamic> response}) {
    switch (response.statusCode) {
      case 400:
        return ServerFailure(errorMsg: 'Bad Request');
      case 401:
        return ServerFailure(errorMsg: 'Unauthorized');
      case 403:
        return ServerFailure(errorMsg: 'Forbidden');
      case 404:
        return ServerFailure(errorMsg: 'Not Found');
      case 422:
        return ServerFailure(errorMsg: 'Unprocessable Entity');
      case 500:
        return ServerFailure(errorMsg: 'Internal Server Error');
      default:
        return ServerFailure(errorMsg: 'There was an error');
    }
  }
}
