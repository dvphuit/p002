import 'package:get/get.dart';
import 'package:ku_app/ui/home/about/about_page.dart';
import 'package:ku_app/ui/home/contact/contact_page.dart';
import 'package:ku_app/ui/home/home_binding.dart';
import 'package:ku_app/ui/home/home_page.dart';
import 'package:ku_app/ui/home/promo/promo_page.dart';
import 'package:ku_app/ui/home/support/support_page.dart';
import 'package:ku_app/ui/splash/splash_page.dart';
import 'package:ku_app/ui/term_of_use/term_of_use_page.dart';
import 'package:ku_app/ui/webview/web_view_page.dart';

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
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HOME,
      binding: HomeBinding(),
      page: () => HomePage(),
      transition: Transition.cupertino,
      children: [
        GetPage(
          name: Routes.SUPPORT,
          page: () => SupportPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: Routes.PROMO,
          page: () => PromoPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: Routes.ABOUT,
          page: () => AboutPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: Routes.CONTACT,
          page: () => ContactPage(),
          transition: Transition.cupertino,
        ),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => SupportPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => SupportPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.WEB,
      page: () => WebViewPage(),
      transition: Transition.cupertino,
    ),
  ];
}
