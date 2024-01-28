import 'package:flutter/material.dart';
import 'package:alhisn_alshamel/controller/home_controller.dart';

class AppColor {
  static const Color grey = Color(0xff515151);
  static const Color black = Color(0xff000000);
  static const Color backgroundColor = Color(0xffFEFEFD);
  static const Color primaryColor = Color(0xff009942);
  // static const Color primaryColor = Color(0xff005fdc);
  static  Color primaryColorTwo = Color(myServices.sharedPreferences.getInt("color")??0xff005fdc);
  static const Color secondaryColor = Color(0xe0ece9e9);
  static const Color red = Color(0xffff0000);
  static  Color success = Color(0xff729863);
  static const Color green = Color(0xff429900);

}
