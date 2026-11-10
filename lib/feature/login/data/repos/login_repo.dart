import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/network/api_service.dart';
import 'package:shop_app/feature/login/data/models/login_model.dart';

class LoginRepo {
  final ApiService _api;
  LoginRepo(this._api);

  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final json = await _api.post(
        endPoint: 'login',
        data: {'email': email, 'password': password},
      );
      final model = LoginModel.fromJson(json);

      // الـ API ممكن ترجع 200 بس status = false
      if (!model.status) {
        return Left(ServerFailure(model.message ?? 'Login failed'));
      }
      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }
}