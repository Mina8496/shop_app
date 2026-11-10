import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/login/data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginRepo) : super(LoginInitialState());

  final LoginRepo _loginRepo;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final result = await _loginRepo.login(email: email, password: password);

    result.fold(
      (failure) => emit(LoginErrorState(failure.message)),
      (loginModel) => emit(LoginSuccessState(loginModel)),
    );
  }
}