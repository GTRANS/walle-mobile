import 'package:auto_size_text/auto_size_text.dart';
import '../../services/services.dart';
import '../../view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../model/auth_model.dart';
import '../../constants/color_constants.dart';
import '../../widgets/otp_input.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVerificationScreen extends StatefulWidget {
  const ForgotPasswordVerificationScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordVerificationScreen> createState() =>
      _ForgotPasswordVerificationScreenState();
}

class _ForgotPasswordVerificationScreenState
    extends State<ForgotPasswordVerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResetPasswordRequestInput;

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
            Center(
              child: AutoSizeText(
                args.email ?? '-',
                style: const TextStyle(
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
              onPressed: () async {
                final res =
                    await Provider.of<AuthViewModel>(context, listen: false)
                        .resetPasswordRequest(input: args);

                if (res.status == ApiStatus.success && res.data != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Kirim Ulang Berhasil"),
                      backgroundColor: CustomColors.main,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(res.message!),
                      backgroundColor: CustomColors.error.withOpacity(0.3),
                    ),
                  );
                }
                //Hit API ulang
              },
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
                onPressed: () async {
                  final String otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text +
                      _fieldFive.text +
                      _fieldSix.text;

                  final ResetPasswordRequestInput input =
                      ResetPasswordRequestInput(
                    email: args.email,
                    code: otp,
                  );

                  Navigator.of(context)
                      .pushNamed('/forgot-password', arguments: input);
                },
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
