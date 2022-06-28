import 'package:auto_size_text/auto_size_text.dart';
import '../../constants/color_constants.dart';
import '../../model/auth_model.dart';
import '../../services/services.dart';
import '../../view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestForgotPasswordScreen extends StatefulWidget {
  const RequestForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RequestForgotPasswordScreen> createState() =>
      _RequestForgotPasswordScreenState();
}

class _RequestForgotPasswordScreenState
    extends State<RequestForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: CustomColors.black,
        ),
        title: const Text(
          'Lupa Password',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash.png'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, right: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        }
                        if (value.isNotEmpty) {
                          String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                          RegExp regExp = RegExp(pattern);

                          if (!regExp.hasMatch(value)) {
                            return 'Email tidak valid!';
                          }
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: CustomColors.grey,
                          fontSize: 12.0,
                        ),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.error.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.error.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors.main),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final ResetPasswordRequestInput input =
                            ResetPasswordRequestInput(
                                email: emailController.text);

                        final res = await Provider.of<AuthViewModel>(context,
                                listen: false)
                            .resetPasswordRequest(input: input);

                        if (res.status == ApiStatus.success &&
                            res.data != null) {
                          Navigator.of(context).pushNamed(
                              '/forgot-password-verification',
                              arguments: input);
                        } else {
                          if (res.message != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(res.message!),
                                backgroundColor:
                                    CustomColors.error.withOpacity(0.3),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const AutoSizeText(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
