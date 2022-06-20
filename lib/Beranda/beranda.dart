import 'package:flutter/material.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/baner.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/carousel.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/menu.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/panel_bawah.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Ellipse 4.png"),
                    fit: BoxFit.fill))),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [MainMenu(), Carousel(), Baner(), PanelBawah()],
      )),
    );
  }
}
