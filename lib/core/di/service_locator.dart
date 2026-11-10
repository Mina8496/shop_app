import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/core/network/api_service.dart';
import 'package:shop_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:shop_app/feature/auth/login/presentation/manger/login_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerLazySingleton<Dio>(() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json', 'lang': 'en'},
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
  return dio;
});

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  // factory: كل مرة تفتح الصفحة، Cubit جديد
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

}