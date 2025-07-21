import 'package:dio/dio.dart';
import 'package:eldealer/core/network/api_constant.dart';
import '../errors/error_handler.dart';

class ApiService {
  ApiService({required Dio dio}) : _dio = dio;
  final Dio _dio;

  /// Generalized request method
  Future<dynamic> _request({
    required String method,
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.request(
        endPoint,
        data: body,
        options: Options(
          method: method,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${ApiConstant.token}',
          },
        ),
      );

      return response.data;
    } on Exception catch (e) {
      return _handleError(e);
    }
  }

  /// POST request
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) {
    return _request(method: 'POST', endPoint: endPoint, body: body);
  }

  /// GET request
  Future<dynamic> get({required String endPoint, Map<String, dynamic>? body}) {
    return _request(method: 'GET', endPoint: endPoint, body: body);
  }

  /// PUT request
  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> body,
  }) {
    return _request(method: 'PUT', endPoint: endPoint, body: body);
  }

  /// DELETE request
  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? body,
  }) {
    return _request(method: 'DELETE', endPoint: endPoint, body: body);
  }

  /// Error handling method
  dynamic _handleError(Exception e) {
    if (e is DioException) {
      return ServerFailure.formDioException(e);
    } else {
      return ServerFailure(errorMsg: e.toString());
    }
  }
}
