import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/themes.dart';
import 'package:shop_app/feature/on_boarding/presentation/page/on_boarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: const OnBoardingPage());
  }
}
