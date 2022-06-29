import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  buildTextField("Nama", "Input Nama"),
                  buildTextField("No HP", "Input No HP"),
                  buildTextField("Email", "Input Email"),
                  const SizedBox(height: 160),
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

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 3),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black))),
    );
  }
}
