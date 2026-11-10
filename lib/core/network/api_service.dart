import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Options? _options(String? token) =>
      token == null ? null : Options(headers: {'Authorization': token});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    final response = await _dio.get(
      endPoint,
      queryParameters: query,
      options: _options(token),
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    final response = await _dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      options: _options(token),
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final response = await _dio.put(
      endPoint,
      data: data,
      options: _options(token),
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    String? token,
  }) async {
    final response = await _dio.delete(endPoint, options: _options(token));
    return response.data as Map<String, dynamic>;
  }
}