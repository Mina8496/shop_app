import 'package:flutter/material.dart';
import 'package:shop_app/core/services/dio_helper.dart';
import 'package:shop_app/core/theme/themes.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/on_boarding_page.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    DioHelper.init(baseUrl: 'https://your-api.com/api/');
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
