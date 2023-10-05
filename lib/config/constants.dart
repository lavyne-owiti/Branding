import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

const onboardingPage1color = Colors.white;
const onboardingPage2color = Color(0xffD2D2F1);
final onboardingPage3color = const Color(0xff246EE9).withOpacity(0.1);

final onboardingPage1image = Image.asset(
  "assets/images/hoodyman.png",
  height: 300,
  width: 350,
);
final onboardingPage2image = Image.asset(
  "assets/images/banner.png",
  height: 300,
);
final onboardingPage3image = Image.asset(
  "assets/images/wallb.png",
  height: 300,
);

const String onboardingPage1title = "Hoodies";
const String onboardingPage2title = "Banners";
const String onboardingPage3title = "Wall branding";

const String onboardingPage1body =
    "Get the best,unique and customized hoodies to your own liking.";
const String onboardingPage2body =
    "Customize Banners to find the perfect fit online and build your own brand recognition";
const String onboardingPage3body =
    "We believe in quality that gives your wall a new look defining your style";

const String onboardingPage1counter = '1/3';
const String onboardingPage2counter = '2/3';
const String onboardingPage3counter = '3/3';

final labels = [
  'Payments',
  'Messages',
  'My Orders',
  'About',
  'Logout',
];

final icons = [
  LucideIcons.bell,
  LucideIcons.messagesSquare,
  LucideIcons.shoppingBag,
  LucideIcons.alertCircle,
  LucideIcons.logOut,
];
