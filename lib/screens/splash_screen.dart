import 'dart:async';

import '../services/local_storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    wait();
  }

  void wait() {
    Timer(const Duration(seconds: 1), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    LocalStorage storage = LocalStorage();
    var token = await storage.get(key: 'auth_token');
    var firstTime = await storage.getBool(key: 'first_time') ?? true;

    if (token == null || token.isEmpty) {
      if (firstTime) {
        Navigator.of(context).pushReplacementNamed('/onboarding');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
      await storage.setBool(key: 'first_time', data: true);
    } else {
      Navigator.of(context).pushReplacementNamed('/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.png'),
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
