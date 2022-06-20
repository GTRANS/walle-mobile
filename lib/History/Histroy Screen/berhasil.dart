import 'package:flutter/cupertino.dart';

class Berhasil extends StatefulWidget {
  const Berhasil({Key? key}) : super(key: key);

  @override
  State<Berhasil> createState() => _BerhasilState();
}

class _BerhasilState extends State<Berhasil> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: const Text("Mei 2022"),
          )
        ],
      ),
    );
  }
}
