import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  DioHelper._();

  static late Dio _dio;

  /// لازم تتنده مرة واحدة في main() قبل runApp
  static void init({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // الـ logging بيشتغل في وضع debug بس
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  static Options _options({String? token, String lang = 'en'}) {
    return Options(headers: {'lang': lang, 'Authorization': ?token});
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) {
    return _dio.get(
      url,
      queryParameters: query,
      options: _options(token: token, lang: lang),
    );
  }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) {
    return _dio.post(
      url,
      data: data,
      queryParameters: query,
      options: _options(token: token, lang: lang),
    );
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) {
    return _dio.put(
      url,
      data: data,
      queryParameters: query,
      options: _options(token: token, lang: lang),
    );
  }

  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) {
    return _dio.patch(
      url,
      data: data,
      queryParameters: query,
      options: _options(token: token, lang: lang),
    );
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) {
    return _dio.delete(
      url,
      queryParameters: query,
      options: _options(token: token, lang: lang),
    );
  }

  /// بتحوّل DioException لرسالة مفهومة تعرضها للمستخدم
  static String errorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'انتهت مهلة الاتصال، حاول مرة أخرى';
      case DioExceptionType.connectionError:
        return 'تأكد من اتصالك بالإنترنت';
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          return data['message'].toString();
        }
        return 'حدث خطأ من السيرفر (${e.response?.statusCode})';
      case DioExceptionType.cancel:
        return 'تم إلغاء الطلب';
      default:
        return 'حدث خطأ غير متوقع';
    }
  }
}
