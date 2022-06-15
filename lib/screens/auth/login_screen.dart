import 'package:auto_size_text/auto_size_text.dart';
import 'package:capstone/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // final viewModel = LoginViewModel();

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
                          Navigator.of(context).pushNamed('/forgot-password');
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
                          // Response res = await viewModel.login(
                          //     email: emailController.text,
                          //     password: passwordController.text);

                          // var code = res.statusCode;

                          // if (code == 200) {
                          //   SharedPreferences prefs =
                          //       await SharedPreferences.getInstance();

                          //   prefs.setString('token', res.data['token']);

                          //   Navigator.of(context).pushNamedAndRemoveUntil(
                          //       '/main', (route) => false);
                          // } else if (code == 401) {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(SnackBar(
                          //     content: const Text('Invalid Credential'),
                          //     backgroundColor: Colors.red.shade300,
                          //   ));
                          // }
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
