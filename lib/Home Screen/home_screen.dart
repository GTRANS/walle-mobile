import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home%20Screen/beranda.dart';
import 'package:flutter_application_2/Home%20Screen/history.dart';
import 'package:flutter_application_2/Home%20Screen/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> body = [Beranda(), const History(), const Profile()];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        onTap: _onTap,
      ),
    );
  }
}
