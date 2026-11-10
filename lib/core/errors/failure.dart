import 'package:dio/dio.dart';

class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Connection timeout, try again');
      case DioExceptionType.connectionError:
        return const ServerFailure('No internet connection');
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          return ServerFailure(data['message'].toString());
        }
        return ServerFailure('Server error (${e.response?.statusCode})');
      default:
        return const ServerFailure('Something went wrong');
    }
  }
}
