import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObscurePassword = true;
  Future exitDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Kamu Yakin?"),
              content: const Text("Ingin Keluar Dari Aplikasi?"),
              actions: [
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text("KELUAR")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("BATAL"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          exitDialog();
          return Future.value(false);
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 250, 250),
            appBar: AppBar(
              title: const Text("Profil"),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 4),
                                color: Colors.green),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ))
                    ]),
                  ),
                  const SizedBox(height: 35),
                  buildTextField("Nama", "Input Nama", false),
                  buildTextField("No HP", "Input No HP", false),
                  buildTextField("Email", "Input Email", false),
                  buildTextField("Password", "********", true),
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          exitDialog();
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.grey,
                            ),
                            Text(
                              "Keluar",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextField(
          obscureText: isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ))
                  : null,
              contentPadding: const EdgeInsets.only(bottom: 3),
              labelText: labelText,
              labelStyle: const TextStyle(fontSize: 20),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black))),
    );
  }
}
