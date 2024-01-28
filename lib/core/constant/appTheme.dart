import 'package:flutter/material.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
// ThemeData englishTheme = ThemeData(
//     fontFamily: "PlayfairDisplay",
//     primarySwatch: Colors.blue,
//     textTheme: const TextTheme(
//       headline1: TextStyle(
//           color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold),
//       headline2: TextStyle(
//           color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold),
//       bodyText1: TextStyle(
//           height: 2,
//           fontSize: 14,
//           color: AppColor.grey,
//           fontWeight: FontWeight.bold),
//       bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
//     ));

ThemeData englishTheme = ThemeData(
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(color: AppColor.backgroundColor, fontSize: 16, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: AppColor.backgroundColor, fontSize: 26, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(height: 2, fontSize: 14, color: AppColor.grey, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
    ),
    scaffoldBackgroundColor: AppColor.black,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColor.black));
ThemeData arabicTheme = ThemeData(
  primaryColor:  Color(0xff009942),
    fontFamily: "Scheherazade",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: AppColor.backgroundColor, fontSize: 18, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(height: 2, fontSize: 14, color: AppColor.grey, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColor.backgroundColor),
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.backgroundColor),
    backgroundColor: AppColor.backgroundColor);
ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xff005fdc),
  fontFamily: "Scheherazade",
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headline1: TextStyle(color: AppColor.backgroundColor, fontSize: 18, fontWeight: FontWeight.bold),
    headline3: TextStyle(color: AppColor.backgroundColor, fontSize: 18, fontWeight: FontWeight.bold),
    headline2: TextStyle(color: AppColor.backgroundColor, fontSize: 26, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(height: 2, fontSize: 14, color: AppColor.backgroundColor, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
  ),
  scaffoldBackgroundColor: AppColor.black,
  drawerTheme: const DrawerThemeData(backgroundColor: AppColor.black),
  appBarTheme: const AppBarTheme(backgroundColor: AppColor.black),
  backgroundColor: AppColor.black,
);
