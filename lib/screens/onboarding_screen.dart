import 'package:auto_size_text/auto_size_text.dart';
import 'package:capstone/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'onboarding_items.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        item['header'],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black,
                        ),
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        item['description'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: CustomColors.black,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? CustomColors.main
                    : CustomColors.grey,
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page ?? 0.0;
                });
              });
              return slides[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: bottomSlides(),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSlides() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
            Visibility(
              visible: currentPage >= 1.0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: OutlinedButton(
                onPressed: () {
                  _pageViewController.jumpToPage((currentPage - 1).toInt());
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: CustomColors.transparent,
                  ),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ] +
          <Widget>[
            Row(
              children: indicator(),
            ),
          ] +
          <Widget>[
            OutlinedButton(
              onPressed: () {
                if (currentPage == 3.0) {
                  Navigator.of(context).pushNamed('/login');
                } else {
                  _pageViewController.jumpToPage((currentPage + 1).toInt());
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: CustomColors.transparent,
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Lanjut',
                    style: TextStyle(
                      color: CustomColors.main,
                      fontSize: 16.0,
                    ),
                  ),
                  Image.asset(
                    'assets/onboarding/next.png',
                  ),
                ],
              ),
            ),
          ],
    );
  }
}
