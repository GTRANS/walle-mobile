import 'package:flutter/material.dart';

class Tertunda extends StatefulWidget {
  const Tertunda({Key? key}) : super(key: key);

  @override
  State<Tertunda> createState() => _TertundaState();
}

class _TertundaState extends State<Tertunda> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tidak Ada Transaksi", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
