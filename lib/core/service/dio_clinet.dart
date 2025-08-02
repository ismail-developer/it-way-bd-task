import 'package:dio/dio.dart';
import 'package:it_way_bd_task/core/utils/app_logger.dart';

class DioClient {
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: _globalHeaders(),
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.type == DioExceptionType.connectionTimeout) {
            AppLogger.error('Connection Timeout');
          } else if (e.type == DioExceptionType.sendTimeout) {
            AppLogger.error('Send Timeout');
          } else if (e.type == DioExceptionType.receiveTimeout) {
            AppLogger.error('Receive Timeout');
          } else if (e.type == DioExceptionType.badResponse) {
            AppLogger.error(
              'Server responded with status: ${e.response?.statusCode}',
              error: e.response?.data,
            );
          } else if (e.type == DioExceptionType.cancel) {
            AppLogger.error('Request was cancelled');
          } else {
            AppLogger.error('Unexpected error: ${e.message}');
          }
          return handler.next(e);
        },
      ),
    );
  }

  late final Dio _dio;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  Dio get dio => _dio;

  Map<String, dynamic> _globalHeaders() {
    return {
      'Accept': 'application/json',
      // Uncomment below line if x-api-key is required
      // 'x-api-key': Env().xApiKey,
    };
  }

  Map<String, dynamic> getRefinedHeaders({
    required Map<String, dynamic> headers,
  }) {
    return {
      'Accept': null,
      ...headers,
    };
  }
}
