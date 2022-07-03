import 'package:flutter/material.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/menu.dart';

class Paket extends StatefulWidget {
  const Paket({Key? key}) : super(key: key);

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  TextEditingController myController = TextEditingController();
  List operator = [
    "assets/operator_default.png",
    "assets/indosat.png",
    "assets/telkomsel.png",
    "assets/kartu3.png",
    "assets/xl.png",
    "assets/axis.png",
    "assets/smartfren.png",
  ];
  int nomor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket Data"),
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
                .pop(MaterialPageRoute(builder: (_) => const MainMenu()));
          },
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              height: 60,
              width: 95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blue, blurRadius: 2, spreadRadius: 1)
                  ]),
              child: Image.asset(operator[nomor]),
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.length == 4 && value == "0857" ||
                        value == "0856") {
                      nomor = 1;
                    } else if (value.length == 4 && value == "0852" ||
                        value == "0853" ||
                        value == "0811" ||
                        value == "0812" ||
                        value == "0813" ||
                        value == "0821" ||
                        value == "0822" ||
                        value == "0851") {
                      nomor = 2;
                    } else if (value.length == 4 && value == "0896" ||
                        value == "0895" ||
                        value == "0897" ||
                        value == "0898" ||
                        value == "0899") {
                      nomor = 3;
                    } else if (value.length == 4 && value == "0817" ||
                        value == "0818" ||
                        value == "0819" ||
                        value == "0859" ||
                        value == "0877" ||
                        value == "0878") {
                      nomor = 4;
                    } else if (value.length == 4 && value == "0813" ||
                        value == "0832" ||
                        value == "0833" ||
                        value == "0838") {
                      nomor = 5;
                    } else if (value.length == 4 && value == "0881" ||
                        value == "0882" ||
                        value == "0883" ||
                        value == "0884" ||
                        value == "0885" ||
                        value == "0886" ||
                        value == "0887" ||
                        value == "0888" ||
                        value == "0889") {
                      nomor = 6;
                    } else if (value.length == 3 && value == "081" ||
                        value == "082" ||
                        value == "083" ||
                        value == "084" ||
                        value == "085" ||
                        value == "086" ||
                        value == "087" ||
                        value == "088" ||
                        value == "089") {
                      nomor = 0;
                    }
                  });
                },
                controller: myController,
                keyboardType: TextInputType.number,
                maxLength: 13,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: "No. Hp")),
          ))
        ],
      ),
    );
  }
}
