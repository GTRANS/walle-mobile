import 'package:flutter/material.dart';

import '../Top Up Screen/voucher.dart';

class Baner extends StatelessWidget {
  const Baner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Voucher()));
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset("assets/GG Gaming.png"),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
