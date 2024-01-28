import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import 'package:alhisn_alshamel/view/widget/auth/customButtonAuth.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert".tr,
      titleStyle: const TextStyle(
          color: AppColor.grey, fontSize: 26, fontWeight: FontWeight.bold),
      middleText: "exitFromApp".tr,
      actions: [
        CustomButtonAlert(
            color: AppColor.red,
            onPressed: () {
              exit(0);
            },
            text:"نعم"),
        CustomButtonAlert(
            color: AppColor.primaryColor,
            onPressed: () {
              Get.back();
            },
            text: "لا"),
      ]);
  return Future.value(true);
}
