import 'package:auto_size_text/auto_size_text.dart';
import '../../services/services.dart';
import '../../view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../model/auth_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResetPasswordRequestInput;

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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Required';
                    }
                    if (value.isNotEmpty) {
                      String pattern = r'.{8,}';
                      RegExp regExp = RegExp(pattern);

                      if (!regExp.hasMatch(value)) {
                        return 'Password minimal 8 karakter!';
                      }
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: CustomColors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: _passwordVisible,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Required';
                    }
                    if (value != passwordController.text) {
                      return 'Tidak Sama!';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Ulang Password',
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: CustomColors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: _confirmPasswordVisible,
                ),
              ),
              const SizedBox(height: 90),
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
                        email: args.email,
                        code: args.code,
                        password: passwordController.text,
                      );

                      final res = await Provider.of<AuthViewModel>(context,
                              listen: false)
                          .resetPassword(input: input);

                      if (res.status == ApiStatus.success) {
                        Navigator.of(context)
                            .pushNamed('/forgot-password-success');
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
                    'Konfirmasi',
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
      ),
    );
  }
}
