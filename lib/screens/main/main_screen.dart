import '../../constants/color_constants.dart';
import '../../screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../history/history_screen.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(children: [
            HomeScreen(),
            HistoryScreen(),
            ProfileScreen(),
          ]),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: CustomColors.black)],
                color: CustomColors.white),
            child: const TabBar(
              labelColor: CustomColors.main,
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
                ),
              ],
            ),
          ),
        ),
      );
}
