import 'package:branding/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

int currentPage = 0;

class OnBoardingScreen extends StatelessWidget {
  static String get routePath => "/onboarding";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingWidget(
        image: onboardingPage1image,
        title: onboardingPage1title,
        body: onboardingPage1body,
        color: onboardingPage1color,
        counter: onboardingPage1counter,
      ),
      OnboardingWidget(
        image: onboardingPage2image,
        title: onboardingPage2title,
        body: onboardingPage2body,
        color: onboardingPage2color,
        counter: onboardingPage2counter,
      ),
      OnboardingWidget(
        image: onboardingPage3image,
        title: onboardingPage3title,
        body: onboardingPage3body,
        color: onboardingPage3color,
        counter: onboardingPage3counter,
      ),
    ];

    final liquidController = LiquidController();

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        LiquidSwipe(
          pages: pages,
          liquidController: liquidController,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
          onPageChangeCallback: onPageChangeCallback,
        ),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => liquidController.jumpToPage(page: 2),
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.blue),
              ),
            )),
      ]),
    );
  }
}

onPageChangeCallback(activePageIndex) {
  currentPage = activePageIndex;
}

class OnboardingWidget extends StatelessWidget {
  final Image image;
  final String title;
  final String body;
  final String counter;
  final Color color;

  const OnboardingWidget({
    required this.image,
    required this.title,
    required this.body,
    required this.color,
    required this.counter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30.0),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image,
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  body,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              counter,
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
