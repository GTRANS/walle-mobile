import 'package:capstone/constants/color_constants.dart';
import 'package:flutter/material.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Center(
            child: SafeArea(child: Image.asset("assets/admin.png")),
          ),
          const Text("Selamat Datang Admin"),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Container(
                width: 317,
                height: 75,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(196, 201, 10, 89),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: const [
                    Text("Rp. 1.000.000",
                        style: TextStyle(
                            color: CustomColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    Text("Saldo Saat Ini",
                        style: TextStyle(color: CustomColors.white))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(197, 158, 2, 67),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                width: 317,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Tambah Saldo",
                        style: TextStyle(color: CustomColors.white)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: CustomColors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                width: 317,
                height: 75,
                decoration: const BoxDecoration(
                    color: CustomColors.main,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: const [
                    Text(
                      "Rp. 1.000.000",
                      style: TextStyle(
                          color: CustomColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text("Saldo Keluar",
                        style: TextStyle(color: CustomColors.white))
                  ],
                ),
              ),
              // Text("Saldo Saat Ini"),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 135, 89),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                width: 317,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Selengkapnya",
                        style: TextStyle(color: CustomColors.white)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: CustomColors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
