import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/di/service_locator.dart';
import 'package:shop_app/core/routes/app_navigator.dart';
import 'package:shop_app/core/utils/color_palette.dart';
import 'package:shop_app/core/utils/styles.dart';
import 'package:shop_app/core/widgets/app_snackbar.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/core/widgets/custom_text_form_field.dart';
import 'package:shop_app/feature/login/presentation/manger/login_cubit.dart';
import 'package:shop_app/feature/login/presentation/manger/login_state.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/on_boarding_page.dart';
import 'package:shop_app/feature/register/presentation/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            AppSnackBar.error(context, state.message);
          }
          if (state is LoginSuccessState) {
            AppNavigator.pushReplacement(context, const OnBoardingPage());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text('Login', style: Styles.stylebold26),
                    const SizedBox(height: 15),
                    Text(
                      'Login now to browse our hot offers',
                      style: Styles.styleBold16.copyWith(
                        color: ColorPalette.kPrimaryGray,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      labelText: 'Enter Email Address',
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter email address';
                        }
                        if (!value.contains('@')) {
                          return 'invalid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscure,
                      textInputAction: TextInputAction.done,
                      labelText: 'Enter password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'password is too short';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().userLogin(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    );
                              }
                            },
                          ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        CustomTextButton(
                          text: 'Register',
                          onPressed: () =>
                              AppNavigator.push(context, const RegisterPage()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}