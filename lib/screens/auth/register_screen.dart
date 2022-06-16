import 'package:auto_size_text/auto_size_text.dart';
import 'package:capstone/constants/color_constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          'Daftar',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Required';
                  }
                  return null;
                },
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Nama',
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
              padding:
                  const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
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
              padding:
                  const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: '+62',
                        hintStyle: const TextStyle(
                          color: CustomColors.black,
                          fontSize: 12.0,
                        ),
                        prefixIcon: Image.asset('assets/bendera.png'),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, right: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        }
                        if (value.isNotEmpty) {
                          String pattern =
                              r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
                          RegExp regExp = RegExp(pattern);

                          if (!regExp.hasMatch(value)) {
                            return 'No. HP tidak valid';
                          }
                        }
                        return null;
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'No. HP',
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
              ],
            ),
            const SizedBox(height: 90),
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
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed('/verification');
                  }
                },
                child: const AutoSizeText(
                  'Daftar',
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
    );
  }
}
