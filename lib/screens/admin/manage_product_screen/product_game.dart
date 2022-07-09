import 'package:capstone/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ProductGame extends StatefulWidget {
  const ProductGame({Key? key}) : super(key: key);

  @override
  State<ProductGame> createState() => _ProductGameState();
}

class _ProductGameState extends State<ProductGame> {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Voucher Game"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: const Icon(Icons.search),
                    hintText: "Search"),
              ),
              Row(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
                      child: Container(
                        height: 70,
                        width: 110,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  spreadRadius: 1)
                            ]),
                        child: Image.asset(
                          "assets/playstore.png",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "Google Play Store",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
                      child: Container(
                        height: 70,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  spreadRadius: 1)
                            ]),
                        child: Image.asset(
                          "assets/steam.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const Text(
                      "Steam Wallet",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ]),
            ],
          ),
        ));
  }
}
