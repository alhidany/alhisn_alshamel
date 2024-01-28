import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/onBoardingController.dart';
import 'package:alhisn_alshamel/view/widget/onBoardingWidget/customButton.dart';
import 'package:alhisn_alshamel/view/widget/onBoardingWidget/customSlider.dart';
import 'package:alhisn_alshamel/view/widget/onBoardingWidget/customDotOnBoarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(

          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children:  [
                    const CustomDotOnBoardingWidget(),
                    const Spacer(
                      flex: 2,
                    ),
                    const customButtonOnBoarding(),
                    InkWell(
                      child: Text("تطوير وتصميم بلاقي تك",
                          style:  Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.underline)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
