import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/controller/home_controller.dart';
import 'package:alhisn_alshamel/core/constant/appTheme.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import 'package:alhisn_alshamel/core/constant/routes.dart';
import 'package:alhisn_alshamel/core/localization/changeLocal.dart';
import 'package:alhisn_alshamel/core/services/services.dart';
import 'package:alhisn_alshamel/view/widget/auth/customTextTitleAuth.dart';
import 'package:share_plus/share_plus.dart';
import '../widget/auth/customButtonAuth.dart';
import 'package:vibration/vibration.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.lazyPut(() => HomeControllerImp());
    LocaleController controllerONE = Get.put(LocaleController());
    return Scaffold(
      // backgroundColor: AppColor.backgroundColor,
      drawer: Drawer(
        // backgroundColor: AppColor.backgroundColor,
        child: GetBuilder<HomeControllerImp>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => SingleChildScrollView(

                child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              // child: Image.asset(appImageAsset.logo,
                              //     fit: BoxFit.contain, height: Get.height / 3.7, color: AppColor.primaryColor),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Icon(
                                  Icons.mosque,
                                  size: Get.height / 7,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "setting".tr,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            const Divider(
                              color: AppColor.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              "حجم الخط",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Slider(
                                value: controller.appFrontSize.value,
                                min: 15,
                                max: 35,
                                thumbColor: AppColor.secondaryColor,
                                inactiveColor: AppColor.grey,
                                activeColor: AppColor.primaryColor,
                                onChanged: (value) => {
                                      controller.appFrontSize.value = value,
                                      myServices.sharedPreferences.setDouble("appFrontSize", value),
                                      controller.fetchDataByType(1)
                                    }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.text_increase_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "خط سميك",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: controller.isTrue.value,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    if (controller.isTrue.value == true) {
                                      controller.isTrue.value = false;
                                      myServices.sharedPreferences.setBool("isFontBoldTrue", false);
                                      controller.fetchDataByType(1);
                                    } else {
                                      controller.isTrue.value = true;
                                      myServices.sharedPreferences.setBool("isFontBoldTrue", true);
                                      controller.fetchDataByType(1);
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.text_fields_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "خط عثماني",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: controller.isOthmaniTrue.value,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    if (controller.isOthmaniTrue.value == true) {
                                      controller.isOthmaniTrue.value = false;
                                      myServices.sharedPreferences.setBool("isOthmaniTrue", false);
                                      controller.appFrontFamily.value = "Cairo";
                                      myServices.sharedPreferences.setString("appFrontFamily", "Cairo");
                                      controller.fetchDataByType(1);
                                    } else {
                                      controller.isOthmaniTrue.value = true;
                                      myServices.sharedPreferences.setBool("isOthmaniTrue", true);
                                      controller.appFrontFamily.value = "Scheherazade";
                                      myServices.sharedPreferences.setString("appFrontFamily", "Scheherazade");
                                      controller.fetchDataByType(1);
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.nightlight_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "الوضع الليلي",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: myServices.sharedPreferences.getBool("isDark") ?? false,
                                  // value: controller.isDarkTrue.value,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    if (controller.isDarkTrue.value == true) {
                                      controller.isDarkTrue.value = false;
                                      controllerONE.appTheme = arabicTheme;
                                      Get.changeTheme(arabicTheme);
                                      myServices.sharedPreferences.setBool("isDark", false);
                                    } else {
                                      controller.isDarkTrue.value = true;
                                      controllerONE.appTheme = darkTheme;
                                      Get.changeTheme(darkTheme);
                                      controller.fetchDataByType(1);
                                      myServices.sharedPreferences.setBool("isDark", true);
                                    }
                                  },
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Radio(
                            //             value: 1,
                            //             groupValue: controller.appFontType.value,
                            //             activeColor: AppColor.primaryColor,
                            //             onChanged: (value) {
                            //               controller.appFontType.value = 1;
                            //               controller.appFrontFamily.value = "Scheherazade";
                            //               controller.fetchDataByType(1);
                            //             }),
                            //         Text(
                            //           "عثماني",
                            //           style: Theme.of(context).textTheme.headline1,
                            //         )
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Radio(
                            //             value: 2,
                            //             groupValue: controller.appFontType.value,
                            //             activeColor: AppColor.primaryColor,
                            //             onChanged: (value) {
                            //               controller.appFrontFamily.value = "Cairo";
                            //               controller.appFontType.value = 2;
                            //               controller.fetchDataByType(1);
                            //             }),
                            //         // Text("arabic".tr, style: Theme.of(context).textTheme.headline1),
                            //         Text(
                            //           "عادي",
                            //           style: Theme.of(context).textTheme.headline1,
                            //         )
                            //       ],
                            //     ),
                            //   ],
                            // ),

                            // Icon For Dark Moad
                            // IconButton(
                            //     onPressed: () {
                            //       if (controller.AppTheamsBackgroundColor.value == "0xff000000") {
                            //         controller.AppTheamsBackgroundColor.value = "0xffFEFEFD";
                            //         // myServices.sharedPreferences.setString("backgroundColor", "0xffFEFEFD");
                            //
                            //         controllerONE.appTheme = arabicTheme;
                            //         Get.changeTheme(arabicTheme);
                            //         print("sssss${Get.theme}");
                            //       } else {
                            //         controller.AppTheamsBackgroundColor.value = "0xff000000";
                            //         // myServices.sharedPreferences.setString("backgroundColor", "0xff000000");
                            //
                            //         controllerONE.appTheme = darkTheme;
                            //         Get.changeTheme(darkTheme);
                            //         print("sssss${Get.theme}");
                            //       }
                            //     },
                            //     icon: (controller.AppTheamsBackgroundColor.value) == "0xff000000"
                            //         ? const Icon(
                            //             Icons.shield_moon_rounded,
                            //             color: AppColor.primaryColor,
                            //           )
                            //         : const Icon(
                            //             Icons.shield_moon_outlined,
                            //             color: AppColor.primaryColor,
                            //           )),
                            const Divider(
                              color: AppColor.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.refresh_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "تصفير عدد المرات",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "تنبيه",
                                          backgroundColor: Theme.of(context).backgroundColor,
                                          titleStyle: Theme.of(context).textTheme.headline2,
                                          content: Container(
                                            width: MediaQuery.of(context).size.width * (0.90),
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                            child: CustomTextTitle(text: "سيتم تصفير عدد المرات".toString()),
                                          ),
                                          actions: [
                                            CustomButtonAlert(
                                              color: AppColor.primaryColor,
                                              onPressed: () {
                                                controller.updateAllCounter(1);
                                                // myServices.sharedPreferences.setInt("CounterAll", 0);
                                                Get.back();
                                              },
                                              text: "تأكيد",
                                            ),
                                            CustomButtonAlert(
                                                color: AppColor.grey,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                text: "رجوع"),
                                          ]);
                                    },
                                    icon: const Icon(
                                      Icons.repeat_one_outlined,
                                      color: AppColor.primaryColor,
                                      size: 35,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.refresh_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "تصفير عدد القراءات ",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "تنبيه",
                                          backgroundColor: Theme.of(context).backgroundColor,
                                          titleStyle: Theme.of(context).textTheme.headline2,
                                          content: Container(
                                            width: MediaQuery.of(context).size.width * (0.90),
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                            child: CustomTextTitle(text: "سيتم تصفير عدد القراءات".toString()),
                                          ),
                                          actions: [
                                            CustomButtonAlert(
                                              color: AppColor.primaryColor,
                                              onPressed: () {
                                                myServices.sharedPreferences.setInt("CounterAll", 0);
                                                controller.myCounterForAll.value = 0;
                                                Get.back();
                                              },
                                              text: "تأكيد",
                                            ),
                                            CustomButtonAlert(
                                                color: AppColor.grey,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                text: "رجوع"),
                                          ]);
                                    },
                                    icon: const Icon(
                                      Icons.repeat_one_outlined,
                                      color: AppColor.primaryColor,
                                      size: 35,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.vibration_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      "اهتزاز عند النقر",
                                      style: Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: controller.isVibrateTrue.value,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    if (controller.isVibrateTrue.value == true) {
                                      controller.isVibrateTrue.value = false;
                                      myServices.sharedPreferences.setBool("isVibrateTrue", false);
                                      Vibration.vibrate(duration: 100, amplitude: 20);
                                    } else {
                                      controller.isVibrateTrue.value = true;
                                      myServices.sharedPreferences.setBool("isVibrateTrue", true);
                                      Vibration.vibrate(duration: 500, amplitude: 100);
                                    }
                                  },
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Row(
                            //       children: [
                            //         const Padding(
                            //           padding: EdgeInsets.symmetric(horizontal: 20),
                            //           child: Icon(
                            //             Icons.color_lens_outlined,
                            //             color: AppColor.primaryColor,
                            //           ),
                            //         ),
                            //         Text(
                            //           textAlign: TextAlign.start,
                            //           "لون التطبيق",
                            //           style: Theme.of(context).textTheme.headline1,
                            //         ),
                            //       ],
                            //     ),
                            //     const Padding(
                            //       padding: EdgeInsets.all(9),
                            //       child: InkWell(
                            //         // AppColor.primaryColorTwo = Color(0xff009942);
                            //         // myServices.sharedPreferences.setInt("color", 0xff009942);
                            //         child: CircleAvatar(
                            //           backgroundColor: AppColor.primaryColor,
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        InkWell(
                          child: Text(
                            "تطوير وتصميم بلاقي تك",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(decoration: TextDecoration.underline, color: AppColor.black),
                          ),
                        ),
                      ],
                    ),
              )),
            ),
          );
        }),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.settings,
                color: AppColor.primaryColor, // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          InkWell(
            child: GetBuilder<HomeControllerImp>(builder: (controller) {
              return Container(
                width: Get.width / 10,
                height: Get.width / 12,
                margin: const EdgeInsets.all(6.0),
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.primaryColor),
                ),
                child: Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextTitle(text: controller.myCounterForAll.value.toString()),
                      ],
                    )),
              );
            }),
          ),
          IconButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Get.toNamed(AppRout.home);
              },
              icon: const Icon(
                Icons.home_outlined,
                color: AppColor.primaryColor,
                size: 33,
              )),
        ],
        centerTitle: true,
        title: Text(
          "1".tr,
          style: Theme.of(context).textTheme.headline2,
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<HomeControllerImp>(builder: (controller) {
        ScrollController _scrollController = ScrollController();
        controller.fetchDataByType(1);
        return SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(() => SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height * 0.89,
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      reverse: false,
                      itemCount: controller.areas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.isVibrateTrue.value == true
                                      ? Vibration.vibrate(duration: 100, amplitude: 20)
                                      : null;
                                  controller.idUpdate.text = (controller.areas[index]["id"]).toString();
                                  controller.myCounter.value = controller.areas[index]["Counter"];
                                  controller.myTempCounter.value = controller.areas[index]["RepGroupTime"];

                                  if (controller.areas[index]["Counter"] >= controller.areas[index]["ReptTime"]) {
                                    Vibration.vibrate(duration: 500, amplitude: 128);
                                    if (controller.myTempCounter.value >= 113) {
                                      //Condition to show the third button
                                      Get.defaultDialog(
                                          title: "",
                                          backgroundColor: Theme.of(context).backgroundColor,
                                          titleStyle: Theme.of(context).textTheme.headline2,
                                          content: Container(
                                            width: MediaQuery.of(context).size.width * (0.90),
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                            child: CustomTextTitle(
                                                text: "  لقد أتممت القراءة (${controller.myCounterForAll.value + 1})"),
                                          ),
                                          actions: [
                                            CustomButtonAlert(
                                              color: AppColor.primaryColor,
                                              onPressed: () {
                                                controller.myTempCounter.value = 0;
                                                controller.myCounter.value = 0;
                                                controller.updateAllCounter(1);
                                                int? x = myServices.sharedPreferences.getInt("CounterAll");
                                                myServices.sharedPreferences.setInt("CounterAll", (x! + 1));
                                                controller.myCounterForAll.value =
                                                    myServices.sharedPreferences.getInt("CounterAll")!;
                                                // if (myServices.sharedPreferences.getInt("CounterAll") != 2) {
                                                //
                                                // } else {
                                                //   myServices.sharedPreferences.setInt("CounterAll", 0);
                                                // }
                                                Get.back();
                                                _scrollController.animateTo(
                                                  0,
                                                  duration: const Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              },
                                              text: "مواصلة",
                                            ),
                                            CustomButtonAlert(
                                                color: AppColor.success,
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                      title: "دعوة الحزب",
                                                      backgroundColor: Theme.of(context).backgroundColor,
                                                      titleStyle: Theme.of(context).textTheme.headline2,
                                                      content:  SizedBox(
                                                        height: MediaQuery.of(context).size.height * (0.65),
                                                        child: SingleChildScrollView(
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * (0.99),
                                                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                            child: const CustomTextTitle(
                                                                text:
                                                                "اللهم إني أسألك ببركة هذا الحزب المبارك أن تصليَ وأن تسلمَ على خير خلقك سيدنا محمد وعلى آله وصحبه، وأسألك ببركة هذا الحزب أن تجعلَهُ لي حصنا وحجابا من الشرور ومن أذى الجن والإنس وأن تخرج من بيوتنا وأجسادنا وأولادنا وأهلنا كل سحر وحسد ونظرة وعين وأذى ومضرة وأن تفك وتبطل عنا كل الإرسالات والتسليطات الضارة والخبيثة وكل نحس وعكس وغلق وقفل وأن تخرج من أجسادنا العلل والأسقام والأمراض والآلام والوهن والضعف والوساوس والهموم وأن تنزل على أجسادنا وبيوتنا السكينة والطمأنينة والنور والمودة والرحمة والألفة الله الجامعة والشفاء والصحة والعافية والبركة، إنك ربنا على كل شيء قدير وبالإجابة جدير نعم المولى ونعم النصير."),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        CustomButtonAlert(
                                                          color: AppColor.primaryColor,
                                                          onPressed: () {
                                                            myServices.sharedPreferences.setInt("CounterAll", 0);
                                                            controller.myCounterForAll.value = 0;
                                                            controller.updateAllCounter(1);
                                                            Get.back();
                                                            Get.back();
                                                            _scrollController.animateTo(
                                                              0,
                                                              duration: const Duration(milliseconds: 500),
                                                              curve: Curves.easeInOut,
                                                            );
                                                          },
                                                          text: "إنهاء",
                                                        ),
                                                        CustomButtonAlert(
                                                            color: AppColor.success,
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            text: "رجوع"),
                                                      ]);
                                                },
                                                text: "دعوة الحزب"),
                                            CustomButtonAlert(
                                                color: AppColor.success,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                text: "رجوع"),
                                          ]);
                                      //This is the codtion when they show the third button
                                      // if (myServices.sharedPreferences.getInt("CounterAll") == 2 ||
                                      //     myServices.sharedPreferences.getInt("CounterAll")! >= 6) {
                                      //
                                      // } else {
                                      //   Get.defaultDialog(
                                      //       title: "",
                                      //       backgroundColor: Theme.of(context).backgroundColor,
                                      //       titleStyle: Theme.of(context).textTheme.headline2,
                                      //       content: Container(
                                      //         width: MediaQuery.of(context).size.width * (0.90),
                                      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                      //         child: CustomTextTitle(
                                      //             text: "  لقد أتممت القراءة (${controller.myCounterForAll.value + 1})"),
                                      //       ),
                                      //       actions: [
                                      //         CustomButtonAlert(
                                      //           color: AppColor.primaryColor,
                                      //           onPressed: () {
                                      //             controller.myTempCounter.value = 0;
                                      //             controller.myCounter.value = 0;
                                      //             controller.updateAllCounter(1);
                                      //             int? x = myServices.sharedPreferences.getInt("CounterAll");
                                      //             myServices.sharedPreferences.setInt("CounterAll", (x! + 1));
                                      //             controller.myCounterForAll.value =
                                      //                 myServices.sharedPreferences.getInt("CounterAll")!;
                                      //
                                      //             // if (myServices.sharedPreferences.getInt("CounterAll") != 2) {
                                      //             //
                                      //             // } else {
                                      //             //   myServices.sharedPreferences.setInt("CounterAll", 0);
                                      //             // }
                                      //             Get.back();
                                      //           },
                                      //           text: "مواصلة",
                                      //         ),
                                      //         CustomButtonAlert(
                                      //             color: AppColor.success,
                                      //             onPressed: () {
                                      //               Get.back();
                                      //             },
                                      //             text: "رجوع"),
                                      //       ]);
                                      // }
                                    }
                                  } else {
                                    controller.myCounter.value = controller.myCounter.value + 1;
                                    controller.myTempCounter.value = controller.myTempCounter.value + 1;
                                    controller.updateCounter(1, controller.myCounter.value.toString());
                                    controller.updateGroupCounter(1, controller.myTempCounter.value.toString());
                                    if (controller.areas[index]["Counter"] >= controller.areas[index]["ReptTime"] - 1) {
                                      Vibration.vibrate(duration: 500, amplitude: 100);
                                      if (controller.myTempCounter.value >= 113) {
                                        //Condition to show the third button
                                        Get.defaultDialog(
                                            title: "",
                                            backgroundColor: Theme.of(context).backgroundColor,
                                            titleStyle: Theme.of(context).textTheme.headline2,
                                            content: Container(
                                              width: MediaQuery.of(context).size.width * (0.90),
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                              child: CustomTextTitle(
                                                  text: "  لقد أتممت القراءة (${controller.myCounterForAll.value + 1})"),
                                            ),
                                            actions: [
                                              CustomButtonAlert(
                                                color: AppColor.primaryColor,
                                                onPressed: () {
                                                  controller.myTempCounter.value = 0;
                                                  controller.myCounter.value = 0;
                                                  controller.updateAllCounter(1);
                                                  int? x = myServices.sharedPreferences.getInt("CounterAll");
                                                  myServices.sharedPreferences.setInt("CounterAll", (x! + 1));
                                                  controller.myCounterForAll.value =
                                                      myServices.sharedPreferences.getInt("CounterAll")!;
                                                  // if (myServices.sharedPreferences.getInt("CounterAll") != 2) {
                                                  //
                                                  // } else {
                                                  //   myServices.sharedPreferences.setInt("CounterAll", 0);
                                                  // }
                                                  Get.back();
                                                  _scrollController.animateTo(
                                                    0,
                                                    duration: const Duration(milliseconds: 500),
                                                    curve: Curves.easeInOut,
                                                  );
                                                },
                                                text: "مواصلة",
                                              ),
                                              CustomButtonAlert(
                                                  color: AppColor.success,
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: "دعوة الحزب",
                                                        backgroundColor: Theme.of(context).backgroundColor,
                                                        titleStyle: Theme.of(context).textTheme.headline2,
                                                        content:  SizedBox(
                                                          height: MediaQuery.of(context).size.height * (0.65),
                                                          child: SingleChildScrollView(
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width * (0.99),
                                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                              child: const CustomTextTitle(
                                                                  text:
                                                                  "اللهم إني أسألك ببركة هذا الحزب المبارك أن تصليَ وأن تسلمَ على خير خلقك سيدنا محمد وعلى آله وصحبه، وأسألك ببركة هذا الحزب أن تجعلَهُ لي حصنا وحجابا من الشرور ومن أذى الجن والإنس وأن تخرج من بيوتنا وأجسادنا وأولادنا وأهلنا كل سحر وحسد ونظرة وعين وأذى ومضرة وأن تفك وتبطل عنا كل الإرسالات والتسليطات الضارة والخبيثة وكل نحس وعكس وغلق وقفل وأن تخرج من أجسادنا العلل والأسقام والأمراض والآلام والوهن والضعف والوساوس والهموم وأن تنزل على أجسادنا وبيوتنا السكينة والطمأنينة والنور والمودة والرحمة والألفة الله الجامعة والشفاء والصحة والعافية والبركة، إنك ربنا على كل شيء قدير وبالإجابة جدير نعم المولى ونعم النصير."),
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          CustomButtonAlert(
                                                            color: AppColor.primaryColor,
                                                            onPressed: () {
                                                              myServices.sharedPreferences.setInt("CounterAll", 0);
                                                              controller.myCounterForAll.value = 0;
                                                              controller.updateAllCounter(1);
                                                              Get.back();
                                                              Get.back();
                                                              _scrollController.animateTo(
                                                                0,
                                                                duration: const Duration(milliseconds: 500),
                                                                curve: Curves.easeInOut,
                                                              );
                                                            },
                                                            text: "إنهاء",
                                                          ),
                                                          CustomButtonAlert(
                                                              color: AppColor.success,
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              text: "رجوع"),
                                                        ]);
                                                  },
                                                  text: "دعوة الحزب"),
                                              CustomButtonAlert(
                                                  color: AppColor.success,
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  text: "رجوع"),
                                            ]);

                                        //This is the codtion when they show the third button
                                        // if (myServices.sharedPreferences.getInt("CounterAll") == 2 ||
                                        //     myServices.sharedPreferences.getInt("CounterAll")! >= 6) {
                                        //
                                        // } else {
                                        //   Get.defaultDialog(
                                        //       title: "",
                                        //       backgroundColor: Theme.of(context).backgroundColor,
                                        //       titleStyle: Theme.of(context).textTheme.headline2,
                                        //       content: Container(
                                        //         width: MediaQuery.of(context).size.width * (0.90),
                                        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                        //         child: CustomTextTitle(
                                        //             text: "  لقد أتممت القراءة (${controller.myCounterForAll.value + 1})"),
                                        //       ),
                                        //       actions: [
                                        //         CustomButtonAlert(
                                        //           color: AppColor.primaryColor,
                                        //           onPressed: () {
                                        //             controller.myTempCounter.value = 0;
                                        //             controller.myCounter.value = 0;
                                        //             controller.updateAllCounter(1);
                                        //             int? x = myServices.sharedPreferences.getInt("CounterAll");
                                        //             myServices.sharedPreferences.setInt("CounterAll", (x! + 1));
                                        //             controller.myCounterForAll.value =
                                        //                 myServices.sharedPreferences.getInt("CounterAll")!;
                                        //
                                        //             // if (myServices.sharedPreferences.getInt("CounterAll") != 2) {
                                        //             //
                                        //             // } else {
                                        //             //   myServices.sharedPreferences.setInt("CounterAll", 0);
                                        //             // }
                                        //             Get.back();
                                        //           },
                                        //           text: "مواصلة",
                                        //         ),
                                        //         CustomButtonAlert(
                                        //             color: AppColor.success,
                                        //             onPressed: () {
                                        //               Get.back();
                                        //             },
                                        //             text: "رجوع"),
                                        //       ]);
                                        // }
                                      }
                                    }
                                  }

                                  // print("CounterAll" + controller.myTempCounter.value.toString());
                                  // print("CounterFor All: " + controller.myCounterForAll.value.toString());
                                  // print("Counter " + controller.myCounter.value.toString());
                                  // print("shared  " + myServices.sharedPreferences.getInt("CounterAll").toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      // color: AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: AppColor.primaryColor)),
                                  padding: EdgeInsets.all(Get.width / 40),
                                  margin: EdgeInsets.symmetric(vertical: Get.width / 60, horizontal: Get.width / 55),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15),
                                      Text(
                                        controller.areas[index]["TextOne"].toString(),
                                        style: Theme.of(context).textTheme.headline1!.copyWith(
                                            fontSize: myServices.sharedPreferences.getDouble("appFrontSize"),
                                            fontWeight: controller.isTrue.value == true ? FontWeight.bold : FontWeight.normal,
                                            fontFamily: controller.appFrontFamily.value),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //for Counter
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  width: Get.width / 10,
                                                  height: Get.width / 10,
                                                  margin: const EdgeInsets.all(1.0),
                                                  padding: const EdgeInsets.all(1.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(color: AppColor.primaryColor),
                                                      color: controller.areas[index]["Counter"] >=
                                                              controller.areas[index]["ReptTime"]
                                                          ? AppColor.primaryColor
                                                          : null),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomTextTitle(text: controller.areas[index]["Counter"].toString()),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  عدد المرات:  ${controller.areas[index]["ReptTime"]} ",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.headline1!.copyWith(
                                                    color: AppColor.grey, fontFamily: controller.appFrontFamily.value),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              //Share button
                                              IconButton(
                                                  onPressed: () {
                                                    Share.share(
                                                        "الحصن الشامل\n\n${controller.areas[index]["TextOne"]}\n\n"
                                                        "${controller.areas[index]["ReptTime"]} مرات.",
                                                        subject: 'الحصن الشامل ');
                                                    // print("الحصن الشامل\n\n${controller.areas[index]["TextOne"]}\n\nمرات${controller.areas[index]["ReptTime"]}");
                                                  },
                                                  icon: const Icon(
                                                    Icons.share_outlined,
                                                    color: AppColor.primaryColor,
                                                  )),
                                              //For Fav
                                              // IconButton(
                                              //     onPressed: () {
                                              //       controller.idUpdate.text = (controller.areas[index]["id"]).toString();
                                              //       controller.stateUpdate.text = (controller.areas[index]["Fav"]).toString();
                                              //       if (controller.stateUpdate.text == 1.toString()) {
                                              //         controller.stateUpdate.text = 2.toString();
                                              //         controller.isChange.value = 2;
                                              //         controller.updateData(1);
                                              //       } else {
                                              //         controller.stateUpdate.text = 1.toString();
                                              //         controller.isChange.value = 1;
                                              //         controller.updateData(1);
                                              //       }
                                              //     },
                                              //     icon: (controller.areas[index]["Fav"]) == 2
                                              //         ? const Icon(
                                              //             Icons.star,
                                              //             color: AppColor.primaryColor,
                                              //           )
                                              //         : const Icon(
                                              //             Icons.star_border_rounded,
                                              //             color: AppColor.primaryColor,
                                              //           )),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              controller.areas[index]["TxtTwo"].toString() != ''
                                  ? Positioned(
                                      top: -22,
                                      right: Get.width / 12,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: AppColor.secondaryColor)),
                                        padding: EdgeInsets.symmetric(horizontal: Get.width / 15, vertical: Get.width / 80),
                                        child: Text(
                                          controller.areas[index]["TxtTwo"].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(fontSize: 18, fontFamily: controller.appFrontFamily.value),
                                          textAlign: TextAlign.center,
                                        ),
                                        // child: Text(
                                        //   controller.areas[index]["TxtTwo"].toString(),
                                        //   style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 18),
                                        //   textAlign: TextAlign.center,
                                        // ),
                                      ),
                                    )
                                  : const Text(''),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}
