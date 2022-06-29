import 'package:flutter/material.dart';

import '../../home/widgets/menu.dart';

class Paket extends StatelessWidget {
  const Paket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Paket Data"),
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
              .pop(MaterialPageRoute(builder: (_) => const MainMenu()));
        },
      ),
    ));
  }
}
