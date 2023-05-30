import 'package:flutter/material.dart';
import 'package:social_ease/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:social_ease/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:social_ease/utilities/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingScreen(),
        '/welcome': (context) => WelcomeScreen()
      },
    );
  }
}
