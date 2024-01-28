import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/core/constant/colors.dart';
import 'package:alhisn_alshamel/core/constant/routes.dart';

class PageInformation extends StatelessWidget {
  const PageInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                "تنبيهات",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 30),
              ),
              const Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                    // color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.primaryColor)),
                padding: EdgeInsets.all(Get.width / 40),
                margin: EdgeInsets.symmetric(vertical: Get.width / 60, horizontal: Get.width / 55),
                child: Column(
                  children: [
                    Text(
                      "1- يكرر هذا الحزب 3 أو 7 مرات بعد الفجر وقبل المغرب أو بعدها وقبل النوم. ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 21),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "2- لا تنسَ أن تأتيَ بدعوة الحزب قبل انصرافك من مجلس ذكرك.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 21),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "3- ذوات العذر الشرعي (الحائض و النفساء) يلتزمن الحزب المخصص لهن، ويجتنبن الحزب المعتاد.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 21),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: AppColor.primaryColor)
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: MaterialButton(
                    // color: AppColor.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRout.page1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Text(
                        "استمر لحزب التحصين الشامل ",
                        style: Theme.of(context).textTheme.headline3,
                        // style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: AppColor.primaryColor)
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: MaterialButton(
                    // color: AppColor.primaryColor,
                    onPressed: () {
                      Get.toNamed(AppRout.pageTwo);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Text(
                        "حزب التحصين لذوات الأعذار",
                        style: Theme.of(context).textTheme.headline3,
                        // style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
