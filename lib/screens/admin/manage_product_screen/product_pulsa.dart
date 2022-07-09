import 'package:flutter/material.dart';

import '../../home/home_screen.dart';

class ProductPulsa extends StatelessWidget {
  const ProductPulsa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Manage Product Pulsa"),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context)
              .pop(MaterialPageRoute(builder: (_) => const HomeScreen()));
        },
      ),
    ));
  }
}
