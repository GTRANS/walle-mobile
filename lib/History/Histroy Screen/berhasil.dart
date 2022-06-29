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
            child: const Text(
              "Mei 2022",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/Device.png",
                  height: 45,
                  width: 45,
                ),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Pulsa Indosat (10.000)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Gopay")
                                  ],
                                ),
                              ),
                              const Text("31 Mei 2022"),
                              const SizedBox(
                                height: 20,
                              )
                            ]))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
