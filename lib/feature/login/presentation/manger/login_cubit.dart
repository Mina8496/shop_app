import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/login/presentation/manger/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  
}