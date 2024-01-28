import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/onBoardingController.dart';
import 'package:alhisn_alshamel/data/datasource/static/static.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';

class CustomDotOnBoardingWidget extends StatelessWidget {
  const CustomDotOnBoardingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.all(5),
                          duration: const Duration(microseconds: 900),
                          height: 6,
                          width: controller.currentPage == index ? 20 : 6,
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ))
              ],
            ));
  }
}
