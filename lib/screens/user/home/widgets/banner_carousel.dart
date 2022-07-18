import 'package:auto_size_text/auto_size_text.dart';
import '../../../../constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../top_up/paket.dart';
import '../top_up/pulsa.dart';
import '../top_up/voucher.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: const AutoSizeText(
            "Benefit",
            style: TextStyle(fontSize: 16, color: CustomColors.black),
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
                        child: Image.asset("assets/banner_1.png"),
                      ),
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
                    children: [Image.asset("assets/banner_3.png")],
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
                    children: [Image.asset("assets/banner_2.png")],
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
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/gg_gaming.png"),
                      ),
                    ),
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
                    "assets/bottom_panel.png",
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
