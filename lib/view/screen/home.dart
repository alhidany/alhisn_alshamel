import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/home_controller.dart';
import 'package:alhisn_alshamel/core/constant/appTheme.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import 'package:alhisn_alshamel/core/constant/routes.dart';
import 'package:alhisn_alshamel/core/functions/alertExitApp.dart';
import 'package:alhisn_alshamel/core/localization/changeLocal.dart';
import 'package:alhisn_alshamel/core/services/services.dart';
import 'package:alhisn_alshamel/view/widget/auth/customTextTitleAuth.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    final controllerTwo = Get.put(HomeControllerImp());
    final controllerONE = Get.put(LocaleController());
    Get.lazyPut(() => HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
          leading:  const IconButton( icon: Icon(Icons.arrow_back),color: AppColor.primaryColor, onPressed: alertExitApp),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.nightlight_outlined,
                    color: AppColor.primaryColor, // Change Custom Drawer Icon Color
                  ),
                  onPressed: () {
                    if( controllerTwo.isDarkTrue.value == true){
                      controllerTwo.isDarkTrue.value=false;
                      myServices.sharedPreferences.setBool("isDark", false);
                      controllerONE.appTheme = arabicTheme;
                      Get.changeTheme(arabicTheme);
                    }else{
                      controllerTwo.isDarkTrue.value=true;
                      myServices.sharedPreferences.setBool("isDark", true);
                      controllerONE.appTheme = darkTheme;
                      Get.changeTheme(darkTheme);

                    }
                  },
                );
              },
            ),
            // this was the button to show the on bording bage
            // IconButton(
            //     onPressed: () {
            //       FocusScope.of(context).requestFocus(FocusNode());
            //       Get.toNamed(AppRout.onBoarding);
            //     },
            //     icon: const Icon(
            //       Icons.info_outline_rounded,
            //       color: AppColor.primaryColor,
            //     ))
          ],
          centerTitle: true,
          title: Text(
            "homedis".tr,
            style: Theme.of(context).textTheme.headline2,
          ),
          elevation: 0.0,
         ),
      body: GetBuilder<HomeControllerImp>(builder: (controller) {
        return WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            alignment: Alignment.center,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => {
                    Get.toNamed(AppRout.pageInformation),
                  },
                  child: Container(
                    width: Get.width / 2.1,
                    height: Get.height / 4.1,
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColor.primaryColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.gpp_good,
                          size: 85,
                          color: AppColor.primaryColor,
                        ),
                        CustomTextTitle(text: "1".tr),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width / 2.1,
                  height: Get.height / 4.1,
                  margin: const EdgeInsets.all(3.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColor.primaryColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.line_style,
                        size: 85,
                        color: AppColor.primaryColor,
                      ),
                      CustomTextTitle(text: "2".tr),
                      Container(margin: const EdgeInsets.only(left: 25), alignment: Alignment.bottomLeft, child: Text("soon".tr))
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }),
    );
  }
}
