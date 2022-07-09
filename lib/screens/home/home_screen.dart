import 'package:capstone/screens/admin/body_screen.dart';
// import 'package:capstone/screens/home/widgets/manage_product.dart';
// import 'package:capstone/screens/home/widgets/menu.dart';

import 'package:flutter/material.dart';

import '../admin/manage_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 246, 246),
      appBar: AppBar(
        flexibleSpace: Container(
            padding: const EdgeInsets.all(100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/top_home.png"),
                    fit: BoxFit.fill))),
        title: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [BodyScreen(), ManageProduct()],
      )),
    );
  }
}
