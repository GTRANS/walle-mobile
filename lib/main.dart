import 'view_models/user/product_view_model.dart';
import 'view_models/user/provider_view_model.dart';
import 'view_models/user/transaction_view_model.dart';
import 'view_models/user/user_view_model.dart';
import 'view_models/user/token_view_model.dart';
import 'view_models/user/auth_view_model.dart';
import 'screens/user/main/main_screen.dart';
import 'screens/user/auth/forgot_password_screen.dart';
import 'screens/user/auth/forgot_password_success_screen.dart';
import 'screens/user/auth/forgot_password_verification_screen.dart';
import 'screens/user/auth/request_forgot_password_screen.dart';
import 'screens/user/auth/login_screen.dart';
import 'screens/user/auth/register_screen.dart';
import 'screens/user/auth/verification_screen.dart';
import 'screens/user/onboarding_screen.dart';
import 'screens/user/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => TokenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => TransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderViewModel(),
        ),
      ],
      child: MaterialApp(
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
          '/request-forgot-password': (_) =>
              const RequestForgotPasswordScreen(),
          '/forgot-password-verification': (_) =>
              const ForgotPasswordVerificationScreen(),
          '/forgot-password': (_) => const ForgotPasswordScreen(),
          '/forgot-password-success': (_) => const ForgotPasswordSuccess(),
          '/verification': (_) => const VerificationScreen(),
          '/main': (_) => const MainScreen(),
        },
      ),
    ),
  );
}
