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
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (_) => const SplashScreen(),
      '/onboarding': (_) => const OnboardingScreen(),
    },
  ));
}
