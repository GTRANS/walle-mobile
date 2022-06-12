import 'package:capstone/screens/auth/forgot_password_screen.dart';
import 'package:capstone/screens/auth/login_screen.dart';
import 'package:capstone/screens/auth/register_screen.dart';
import 'package:capstone/screens/auth/verification_screen.dart';
import 'package:capstone/screens/onboarding_screen.dart';
import 'package:capstone/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // runApp(MultiProvider(
  //   providers: [],
  //   child: MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: '/',
  //     routes: {
  //       '/': (_) => const SplashScreen(),
  //       '/onboarding': (_) => const OnboardingScreen(),
  //     },
  //   ),
  // ));

  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (_) => const SplashScreen(),
      '/onboarding': (_) => const OnboardingScreen(),
      '/login': (_) => const LoginScreen(),
      '/register': (_) => const RegisterScreen(),
      '/forgot-password': (_) => const ForgotPasswordScreen(),
      '/verification': (_) => const VerificationScreen(),
    },
  ));
}
