import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/core/constant/appTheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  String? cruntalng;
  MyServices myServices = Get.find();
  ThemeData appTheme = arabicTheme;

  GlobalKey<FormState> areaNewUnit = GlobalKey<FormState>();

  late TextEditingController areaUnitOneText;
  late TextEditingController areaUnitOneValue;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    myServices.sharedPreferences.setString("appFrontFamily", "Scheherazade");
    myServices.sharedPreferences.setInt("color", 0xff009942);
    myServices.sharedPreferences.setDouble("appFrontSize", 20.5);
    myServices.sharedPreferences.setInt("CounterAll", 0);
    myServices.sharedPreferences.setInt("CounterAllPageTwo", 0);
    myServices.sharedPreferences.setBool("isVibrateTrue", true);
    myServices.sharedPreferences.setBool("isFontBoldTrue", true);
    myServices.sharedPreferences.setBool("isDarkTrue", false);
    myServices.sharedPreferences.setBool("isOthmaniTrue", true);
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    // print(myServices.sharedPreferences.get('lang'));
  }

  @override
  addUnitToShare() async {
    var formDate = areaNewUnit.currentState;
    if (formDate!.validate()) {
      myServices.sharedPreferences.setString("unitOneText", areaUnitOneText.text);
      myServices.sharedPreferences.setString("unitOneValue", areaUnitOneValue.text);

    } else {

    }
  }

  @override
  void onInit() {
    // ignore: unrelated_type_equality_checks
    if (myServices.sharedPreferences.getBool("isDark") == true) {
      Get.changeTheme(darkTheme);
      appTheme = darkTheme;
    } else {
      Get.changeTheme(arabicTheme);
      appTheme = arabicTheme;
    }

    areaUnitOneText = TextEditingController();
    areaUnitOneValue = TextEditingController();
    if (myServices.sharedPreferences.getString("unitOneValue") == null) {
      areaUnitOneText.text = "";
      areaUnitOneValue.text = "";
    } else {
      areaUnitOneText.text = myServices.sharedPreferences.getString("unitOneText").toString();
      areaUnitOneValue.text = myServices.sharedPreferences.getString("unitOneValue").toString();
    }

    language = const Locale("ar");
    cruntalng = "ar";
    appTheme = arabicTheme;

    // It is very important code for check the local lang and

    // if (sharedPrefLang == "ar") {
    //   language = const Locale("ar");
    //   cruntalng = "ar";
    //   appTheme = arabicTheme;
    // } else if (sharedPrefLang == "en") {
    //   language = const Locale("en");
    //   appTheme = englishTheme;
    //   cruntalng = "en";
    // } else {
    //   language = Locale(Get.deviceLocale!.languageCode);
    // }
    super.onInit();
  }
}
