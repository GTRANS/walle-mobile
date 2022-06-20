import 'package:flutter/material.dart';

import '../Top Up Screen/paket.dart';
import '../Top Up Screen/pulsa.dart';
import '../Top Up Screen/voucher.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Benefit",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Pulsa()));
                },
                child: Image.asset(
                  "assets/image 1.png",
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Paket()));
                },
                child: Image.asset("assets/image 3.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Voucher()));
                },
                child: Image.asset("assets/image 2.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
