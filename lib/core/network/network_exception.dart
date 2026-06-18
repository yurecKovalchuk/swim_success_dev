import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  factory NetworkException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection');
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Request timed out');
      case DioExceptionType.badResponse:
        return NetworkException(_messageFromStatusCode(e.response?.statusCode));
      case DioExceptionType.cancel:
        return const NetworkException('Request was cancelled');
      case DioExceptionType.badCertificate:
        return const NetworkException('SSL certificate error');
      case DioExceptionType.unknown:
        final msg = e.message ?? '';
        if (msg.contains('SocketException') || msg.contains('network')) {
          return const NetworkException('No internet connection');
        }
        return const NetworkException('Something went wrong');
    }
  }

  static String _messageFromStatusCode(int? code) {
    switch (code) {
      case 400:
        return 'Bad request (400)';
      case 401:
        return 'Unauthorized (401)';
      case 403:
        return 'Access denied (403)';
      case 404:
        return 'Not found (404)';
      case 422:
        return 'Invalid data (422)';
      case 500:
        return 'Server error (500)';
      case 503:
        return 'Service unavailable (503)';
      default:
        return 'Server error (${code ?? '?'})';
    }
  }

  @override
  String toString() => message;
}
