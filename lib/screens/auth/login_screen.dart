import 'package:auto_size_text/auto_size_text.dart';
import '../../services/services.dart';
import '../../view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../model/auth_model.dart';
import 'package:flutter/material.dart';

import '../../view_models/token_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/splash.png',
              width: 162.0,
              height: 43.0,
            ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 45),
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, right: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
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
                        isDense: true,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/request-forgot-password');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: CustomColors.transparent,
                          ),
                        ),
                        child: const AutoSizeText(
                          'Lupa Password?',
                          style: TextStyle(
                              color: CustomColors.main, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.main),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final LoginInput input = LoginInput(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          final res = await Provider.of<AuthViewModel>(context,
                                  listen: false)
                              .login(input: input);

                          if (res.status == ApiStatus.success &&
                              res.data != null) {
                            await Provider.of<TokenViewModel>(context,
                                    listen: false)
                                .setToken(token: res.data?.token ?? "");

                            Navigator.of(context).pushNamed('/main');
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
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  Center(
                    child: AutoSizeText(
                      'atau',
                      style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: CustomColors.main,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const AutoSizeText(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.main,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
