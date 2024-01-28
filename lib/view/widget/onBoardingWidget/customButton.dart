import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/onBoardingController.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import 'package:alhisn_alshamel/core/localization/changeLocal.dart';

class customButtonOnBoarding extends GetView<OnBoardingControllerImp> {

  const customButtonOnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerTwo = Get.put(LocaleController());
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(
          color: AppColor.primaryColor,
          onPressed: () {
            controllerTwo.changeLang("ar");
            controller.next();
          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 90, vertical: 2),
            child: Text(
              "continue".tr,
              style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}