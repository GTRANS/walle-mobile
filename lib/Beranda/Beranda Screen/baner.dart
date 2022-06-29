import 'package:flutter/material.dart';

import '../Top Up Screen/paket.dart';
import '../Top Up Screen/pulsa.dart';
import '../Top Up Screen/voucher.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: const Text(
            "Benefit",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Pulsa()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 3),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset("assets/image 1.png"),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Paket()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [Image.asset("assets/image 3.png")],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Voucher()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [Image.asset("assets/image 2.png")],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const Voucher()));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset("assets/GG Gaming.png"),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                  Image.asset(
                    "assets/Panel Bawah.png",
                    fit: BoxFit.contain,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
    // );
  }
}
