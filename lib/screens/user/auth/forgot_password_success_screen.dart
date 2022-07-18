import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';

class ForgotPasswordSuccess extends StatefulWidget {
  const ForgotPasswordSuccess({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSuccess> createState() => _ForgotPasswordSuccessState();
}

class _ForgotPasswordSuccessState extends State<ForgotPasswordSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          'Lupa Password',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Center(
            child: AutoSizeText(
              'PASSWORD DIPERBARUI',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: CustomColors.black,
              ),
              maxLines: 2,
            ),
          ),
          Image.asset(
            'assets/success.png',
            width: 160,
            height: 160,
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomColors.main),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const AutoSizeText(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
