import 'package:flutter/material.dart';
import 'package:flutter_application_2/Beranda/beranda.dart';
import 'package:flutter_application_2/History/history.dart';
import 'package:flutter_application_2/Profil/profile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(children: [Beranda(), History(), Profile()]),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)], color: Colors.white),
          child: const TabBar(
            labelColor: Colors.green,
            labelPadding: EdgeInsets.all(0.5),
            indicatorWeight: 1,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                iconMargin: EdgeInsets.only(bottom: 5),
                text: "Beranda",
              ),
              Tab(
                icon: Icon(Icons.history),
                iconMargin: EdgeInsets.only(bottom: 5),
                text: "Riwayat",
              ),
              Tab(
                icon: Icon(Icons.person),
                iconMargin: EdgeInsets.only(bottom: 5),
                text: "Profil",
              )
            ],
          ),
        ),
      ));
}
