import 'package:flutter/material.dart';

import '../top_up/paket.dart';
import '../top_up/pulsa.dart';
import '../top_up/voucher.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/phone.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(child: Text("No HP Utama : 0869696969"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Pulsa()));
                                },
                                icon: Image.asset("assets/pulsa.png"),
                                iconSize: 60,
                              ),
                              const Text("Pulsa",
                                  style: TextStyle(fontSize: 13))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Paket()));
                                },
                                icon: Image.asset("assets/paket.png"),
                                iconSize: 60,
                              ),
                              const Text("Paket Data",
                                  style: TextStyle(fontSize: 13))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Voucher()));
                                },
                                icon: Image.asset("assets/voucher_game.png"),
                                iconSize: 60,
                              ),
                              const Text("Voucher Game",
                                  style: TextStyle(fontSize: 13))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
