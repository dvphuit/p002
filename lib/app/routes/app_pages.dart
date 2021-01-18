import 'package:get/get.dart';
import 'package:ku_app/app/ui/home/about/about_page.dart';
import 'package:ku_app/app/ui/home/contact/contact_page.dart';
import 'package:ku_app/app/ui/home/home_binding.dart';
import 'package:ku_app/app/ui/home/home_page.dart';
import 'package:ku_app/app/ui/home/post/detail/post_detail_page.dart';
import 'package:ku_app/app/ui/home/post/list_post_binding.dart';
import 'package:ku_app/app/ui/home/post/list_post_page.dart';
import 'package:ku_app/app/ui/home/promo/promo_page.dart';
import 'package:ku_app/app/ui/home/support/support_page.dart';
import 'package:ku_app/app/ui/login/login_page.dart';
import 'package:ku_app/app/ui/register/register_page.dart';
import 'package:ku_app/app/ui/splash/splash_page.dart';
import 'package:ku_app/app/ui/term_of_use/term_of_use_page.dart';
import 'package:ku_app/app/ui/webview/web_view_page.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      transition: Transition.fade,
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
        GetPage(
            name: Routes.LIST_POST,
            page: () => ListPostPage(),
            binding: ListPostBinding(),
            transition: Transition.cupertino,
            children: [
              GetPage(
                name: Routes.POST_DETAIL,
                page: () => PostDetailPage(),
                transition: Transition.cupertino,
              )
            ]),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.WEB,
      page: () => WebViewPage(),
      transition: Transition.cupertino,
    ),
  ];
}
