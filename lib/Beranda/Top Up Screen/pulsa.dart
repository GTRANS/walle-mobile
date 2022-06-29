import 'package:flutter/material.dart';
import 'package:flutter_application_2/Beranda/Beranda%20Screen/menu.dart';

class Pulsa extends StatefulWidget {
  const Pulsa({Key? key}) : super(key: key);

  @override
  State<Pulsa> createState() => _PulsaState();
}

class _PulsaState extends State<Pulsa> {
  // TextEditingController controller = TextEditingController(text: "No. Hp");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pulsa"),
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
        children: const [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 13,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "No. Hp"),
              ),
            ),
          ),
        ],
      ),
      // TextField(
      //   decoration: InputDecoration(
      //       border: OutlineInputBorder(
      //           borderSide: BorderSide(width: 2),
      //           borderRadius: BorderRadius.all(Radius.circular(30)))),
      // ),
      // ],
      // ),
    );
  }
}
