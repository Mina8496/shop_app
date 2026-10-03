import 'package:flutter/material.dart';
import 'package:shop_app/core/routes/app_navigator.dart';
import 'package:shop_app/core/utils/color_palette.dart';
import 'package:shop_app/core/utils/styles.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/core/widgets/app_snackbar.dart';
import 'package:shop_app/core/widgets/custom_text_field.dart';
import 'package:shop_app/feature/register/presentation/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);
    try {
      // No authentication provider is configured in this project yet.
      AppSnackBar.info(context, 'Login service is not configured yet.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text('Login', style: Styles.stylebold26),
              SizedBox(height: 15),

              Text(
                'Login now to browse our hot offers',
                style: Styles.styleBold16.copyWith(
                  color: ColorPalette.kPrimaryGray,
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                controller: emailController,
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
              SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
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
              SizedBox(height: 40),
              CustomButton(
                text: 'Login',
                isLoading: _isLoading,
                onPressed: _login,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text("Don't have an account?"),
                  CustomTextButton(
                    text: "Register",
                    onPressed: () => AppNavigator.push(context, RegisterPage()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
