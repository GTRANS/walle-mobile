import 'package:flutter/material.dart';

class Gagal extends StatefulWidget {
  const Gagal({Key? key}) : super(key: key);

  @override
  State<Gagal> createState() => _GagalState();
}

class _GagalState extends State<Gagal> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Tidak Ada Transaksi",
        style: TextStyle(fontSize: 15),
      )),
    );
  }
}
