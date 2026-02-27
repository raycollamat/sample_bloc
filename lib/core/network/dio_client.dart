import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = _createDio();
    _configureCertificateHandling();
  }

  Dio get dio => _dio;

  Dio _createDio() {
    final config = AppConfig.instance;

    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: Duration(milliseconds: config.connectionTimeout),
        receiveTimeout: Duration(milliseconds: config.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': config.apiKey,
        },
      ),
    );

    return dio;
  }

  void _configureCertificateHandling() {
    final config = AppConfig.instance;

    if (config.isDevEnvironment && !kIsWeb) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) {
          if (config.isDevEnvironment) {
            // Extract host from the configured base URL
            final uri = Uri.parse(config.baseUrl);
            return host == uri.host && port == uri.port;
          }
          return false;
        };
        return client;
      };
    }
  }

  Exception handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timed out. Please try again.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Unknown error';
        return Exception('Server error $statusCode: $message');
      case DioExceptionType.connectionError:
        return Exception('No internet connection.');
      default:
        return Exception('Something went wrong: ${error.message}');
    }
  }
}
