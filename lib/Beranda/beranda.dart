import 'package:flutter/material.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/baner.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/menu.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 246, 246),
      appBar: AppBar(
        flexibleSpace: Container(
            padding: const EdgeInsets.all(100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Ellipse 4.png"),
                    fit: BoxFit.fill))),
        title: Center(
          child: Image.asset("assets/Logo.png"),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MainMenu(),
          Carousel(),
        ],
      )),
    );
  }
}
