import 'package:get/get.dart';
import 'package:ku_app/ui/home/home_binding.dart';
import 'package:ku_app/ui/home/home_page.dart';
import 'package:ku_app/ui/splash/splash_page.dart';
import 'package:ku_app/ui/term_of_use/term_of_use_page.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.TERM_OF_USE,
      page: () => TermOfUsePage(),
    ),
    GetPage(
      name: Routes.HOME,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
