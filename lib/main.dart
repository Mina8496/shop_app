import 'package:flutter/material.dart';
import 'package:shop_app/core/di/service_locator.dart';
import 'package:shop_app/core/services/remote/dio_helper.dart';
import 'package:shop_app/core/theme/themes.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/on_boarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  DioHelper.init(baseUrl: 'http://192.168.1.105:3000/api/');
  // await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: OnBoardingPage(),
    );
  }
}
