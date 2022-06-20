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
            appBar: AppBar(
              title: const Text("Profil"),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 1,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
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
                          // image: const DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image: AssetImage("assets/emyu.jpg")
                          //     )
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
                  // const TextField(
                  //     decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(bottom: 3),
                  //         labelText: "Nama",
                  //         floatingLabelBehavior: FloatingLabelBehavior.always,
                  //         hintText: "Input ",
                  //         hintStyle: TextStyle(fontSize: 16, color: Colors.black))),
                  // Icon(Icons.arrow_forward_ios),
                  // // const TextField(
                  //     decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(bottom: 3),
                  //         labelText: "Nama",
                  //         floatingLabelBehavior: FloatingLabelBehavior.always,
                  //         hintText: "Input Nama",
                  //         hintStyle: TextStyle(fontSize: 16, color: Colors.black))),
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
                        // child: const Text(
                        //   "Keluar",
                        //   style: TextStyle(fontSize: 14, letterSpacing: 2.2),
                        // )
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
