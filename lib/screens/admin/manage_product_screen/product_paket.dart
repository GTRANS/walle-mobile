import 'package:flutter/material.dart';

import '../../home/home_screen.dart';

class ProductPaket extends StatefulWidget {
  const ProductPaket({Key? key}) : super(key: key);

  @override
  State<ProductPaket> createState() => _ProductPaketState();
}

class _ProductPaketState extends State<ProductPaket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Product Paket"),
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
      ),
    );
  }
}
