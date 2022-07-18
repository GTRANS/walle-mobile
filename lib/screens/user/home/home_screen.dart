import '../../../constants/color_constants.dart';
import '../../../screens/user/home/widgets/menu.dart';
import 'widgets/banner_carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 246, 246),
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
            padding: const EdgeInsets.all(100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/top_home.png"),
                    fit: BoxFit.fill))),
        title: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            MainMenu(),
            BannerCarousel(),
          ],
        ),
      ),
    );
  }
}
