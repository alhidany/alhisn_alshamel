import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhisn_alshamel/core/constant/appTheme.dart';
import 'package:alhisn_alshamel/core/services/services.dart';
import 'package:alhisn_alshamel/data_base/db_helper.dart';

abstract class HomeController extends GetxController {
  deleteData();
}

MyServices myServices = Get.find();

class HomeControllerImp extends HomeController {
  late TextEditingController id;
  late TextEditingController idUpdate;
  late TextEditingController type;
  late TextEditingController textOne;
  late TextEditingController textTwo;
  late TextEditingController counter;
  late TextEditingController favFav;
  late TextEditingController reptTime;
  late TextEditingController stateUpdate;
  late TextEditingController areaUnitOneText;
  late TextEditingController areaUnitOneValue;

  ThemeData appTheme = arabicTheme;
  RxInt appFontType = 1.obs;
  RxInt isChange = 1.obs;
  RxInt isFontBold = 1.obs;
  RxBool isTrue = myServices.sharedPreferences.getBool("isFontBoldTrue")!.obs ;
  RxBool isOthmaniTrue = myServices.sharedPreferences.getBool("isOthmaniTrue")!.obs ;
  RxBool isDarkTrue = false.obs;
  RxBool isVibrateTrue = myServices.sharedPreferences.getBool("isVibrateTrue")!.obs ;
  RxDouble appFrontSize = myServices.sharedPreferences.getDouble("appFrontSize")!.obs ;
  RxString appFrontFamily = myServices.sharedPreferences.getString("appFrontFamily")!.obs  ;
  RxString appThemesBackgroundColor = "0xffFEFEFD".obs;
  RxInt myCounter = 0.obs;
  RxInt myCounterForAll = myServices.sharedPreferences.getInt("CounterAll")!.obs  ;
  RxInt myTempCounter = 0.obs;
  RxList areas = [].obs;
  RxString alert = "".obs;
  RxDouble areasTotal = 0.0.obs;
  bool isShowPass = false;

  RxInt myCounterPageTwo = 0.obs;
  RxInt myCounterForAllPageTwo = myServices.sharedPreferences.getInt("CounterAllPageTwo")!.obs ;
  RxInt myTempCounterPageTwo = 0.obs;

  updateData(type) async {
    DBHelper.dbHelper.updateData(
        tableName: "area",
        model: {
          "fav": int.parse(isChange.value.toString()),
        },
        id: idUpdate.text);
    stateUpdate.clear();
    fetchDataByType(type);
  }


  updateCounter(type, value) async {
    DBHelper.dbHelper.updateData(
        tableName: "area",
        model: {
          "Counter": int.parse(value),
        },
        id: idUpdate.text);

    stateUpdate.clear();
    fetchDataByType(type);
  }

  updateAllCounter(type) async {
    // myTempCounter.value=0;
    DBHelper.dbHelper.updateDataWhenComplaate(tableName: "area", model: {"Counter": 0, "RepGroupTime": 0}, type: type);
    stateUpdate.clear();
    // fetchAreas();
    fetchDataByType(type);
  }

  updateGroupCounter(type,value) async {
    DBHelper.dbHelper.updateDataWhenComplaate(
        tableName: "area",
        model: {
          "RepGroupTime": int.parse(value),
        },
        type: type);
    stateUpdate.clear();
    // fetchAreas();
    fetchDataByType(type);
  }


  updateArea() async {
    alert.value = "";
    DBHelper.dbHelper.updateData(tableName: "area", model: {"state": int.parse(stateUpdate.text), "total": 1}, id: idUpdate.text);
    idUpdate.clear();
    stateUpdate.clear();
  }
  @override
  void onInit() {
    idUpdate = TextEditingController();
    stateUpdate = TextEditingController();
    areas.value = [];
    // fetchAreas();
    fetchDataByType(1);
    super.onInit();
  }

  fetchAreas() async {
    DBHelper.dbHelper.selectData(tableName: "area").then((areasList) => {
          areas.value = areasList,
        });
  }

  fetchDataByType(type) async {
    DBHelper.dbHelper.selectSpecifcdata(tableName: "area", id: type.toString()).then((areasList) => {
          areas.value = areasList,
        });

  }

  @override
  void dispose() {
    idUpdate.dispose();
    stateUpdate.dispose();
    super.dispose();
  }

  @override
  deleteData() {
    DBHelper.dbHelper.deletallRowFromAnyTable(tableName: "area");
    areasTotal.value = 0.0;
    areas.value = [];
  }
}
