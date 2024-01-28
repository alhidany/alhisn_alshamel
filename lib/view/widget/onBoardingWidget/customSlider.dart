import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/onBoardingController.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onePageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(onBoardingList[i].title!,
                    style: Theme.of(context).textTheme.headline2!),
                const SizedBox(
                  height: 50,
                ),
                // Image.asset(onBoardingList[i].image!,
                //     width: Get.width / 1.8,
                //     height: Get.height / 3.5,
                //     fit: BoxFit.fill,
                // color: AppColor.primaryColor),
                Icon(Icons.mosque,size: Get.height/6,color: AppColor.primaryColor,),
                const SizedBox(
                  height: 30,
                ),
                Container(
                   height: Get.height/3.3,
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Text(
                        onBoardingList[i].body!,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline1!,
                      ),
                    )),
              ],
            ));
  }
}
