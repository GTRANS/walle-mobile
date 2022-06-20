import 'package:flutter/material.dart';

class PanelBawah extends StatelessWidget {
  const PanelBawah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                Image.asset(
                  "assets/Panel Bawah.png",
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
