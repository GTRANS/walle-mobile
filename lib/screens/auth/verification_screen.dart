import 'package:auto_size_text/auto_size_text.dart';
import 'package:capstone/constants/color_constants.dart';
import 'package:capstone/widgets/otp_input.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          'Verifikasi',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: AutoSizeText(
                'Kode Verifikasi',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Center(
              child: AutoSizeText(
                'Kode verifikasi telah di kirim melalui Email ke ',
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.black,
                ),
              ),
            ),
            const Center(
              child: AutoSizeText(
                '{data}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.main,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true),
                OtpInput(_fieldTwo, false),
                OtpInput(_fieldThree, false),
                OtpInput(_fieldFour, false),
                OtpInput(_fieldFive, false),
                OtpInput(_fieldSix, false),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const AutoSizeText(
                'Kirim Ulang',
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.main,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
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
                onPressed: () {},
                child: const AutoSizeText(
                  'Konfirmasi',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: CustomColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
