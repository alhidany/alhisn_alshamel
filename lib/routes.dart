import 'package:get/get.dart';
import 'package:alhisn_alshamel/core/constant/routes.dart';
import 'package:alhisn_alshamel/core/middleware/myMiddleware.dart';
import 'package:alhisn_alshamel/view/screen/home.dart';
import 'package:alhisn_alshamel/view/screen/onBoarding.dart';
import 'package:alhisn_alshamel/view/screen/page1.dart';
import 'package:alhisn_alshamel/view/screen/pageInformation.dart';
import 'package:alhisn_alshamel/view/screen/pageTwo.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const OnBoarding(), middlewares: [
    MyMiddleware(),
  ]),

  // GetPage(name: "/", page: () => const Language(), middlewares: [
  //   MyMiddleware(),
  // ]),
  GetPage(name: AppRout.home, page: () => const Home()),
  GetPage(name: AppRout.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRout.page1, page: () => const PageOne()),
  GetPage(name: AppRout.pageTwo, page: () => const PageTwo()),
  GetPage(name: AppRout.pageInformation, page: () => const PageInformation()),
];
