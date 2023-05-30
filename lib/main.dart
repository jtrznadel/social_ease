import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_ease/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:social_ease/utilities/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: OnBoardingScreen(),
    );
  }
}
