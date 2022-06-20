import 'package:flutter/material.dart';

import '../Top Up Screen/paket.dart';
import '../Top Up Screen/pulsa.dart';
import '../Top Up Screen/voucher.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const Pulsa()));
              },
              icon: Image.asset("assets/Frame 67.png"),
              iconSize: 60,
            ),
            const Text("Pulsa", style: TextStyle(fontSize: 13))
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const Paket()));
              },
              icon: Image.asset("assets/Frame 68.png"),
              iconSize: 60,
            ),
            const Text("Paket Data", style: TextStyle(fontSize: 13))
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const Voucher()));
              },
              icon: Image.asset("assets/Frame 72.png"),
              iconSize: 60,
            ),
            const Text("Voucher Game", style: TextStyle(fontSize: 13))
          ],
        ),
      ],
      // ),
      // ]),
    );
  }
}
