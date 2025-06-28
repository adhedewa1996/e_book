import 'package:dio/dio.dart';

import 'interceptors.dart';

class AppClient {
  AppClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://gutendex.com',
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      )..interceptors.addAll([LoggerInterceptor()]);

  late final Dio _dio;

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
