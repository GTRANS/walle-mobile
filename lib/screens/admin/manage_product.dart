import 'package:capstone/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'manage_product_screen/product_game.dart';
import 'manage_product_screen/product_paket.dart';
import 'manage_product_screen/product_pulsa.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({Key? key}) : super(key: key);

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text("Manage Product",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 15, 30, 0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.manageProduct,
                    borderRadius: BorderRadius.circular(5)),
                width: 317,
                height: 60,
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ProductPulsa()));
                  },
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      Image.asset("assets/pulsa_adm.png"),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      const Text("Pulsa")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 15, 30, 0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.manageProduct,
                    borderRadius: BorderRadius.circular(5)),
                width: 317,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ProductPaket()));
                  },
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      Image.asset("assets/paket_adm.png"),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      const Text("Paket Data")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 15, 30, 0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.manageProduct,
                    borderRadius: BorderRadius.circular(5)),
                width: 317,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ProductGame()));
                  },
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      Image.asset("assets/game_adm.png"),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      const Text("Voucher Game")
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
