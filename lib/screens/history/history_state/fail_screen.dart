import 'package:flutter/material.dart';

class FailScreen extends StatefulWidget {
  const FailScreen({Key? key}) : super(key: key);

  @override
  State<FailScreen> createState() => _FailScreenState();
}

class _FailScreenState extends State<FailScreen> {
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
