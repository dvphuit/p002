import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:ku_app/app/ui/home/home_binding.dart';
import 'package:ku_app/app/ui/home/home_page.dart';
import 'package:ku_app/app/ui/home/promo/promo_binding.dart';
import 'package:ku_app/app/ui/home/promo/promo_page.dart';
import 'package:ku_app/app/ui/home/support/support_binding.dart';
import 'package:ku_app/app/ui/home/support/support_page.dart';

class Page {
  final String title;
  final String route;

  Page({
    Key key,
    @required this.title,
    @required this.route,
  });
}

final List<Page> navPages = [
  Page(
    title: "Tin tức",
    route: Routes.HOME,
  ),
  Page(
    title: "Khuyến mãi",
    route: Routes.PROMO,
  ),
  Page(
    title: "Hỗ trợ",
    route: Routes.SUPPORT,
  ),
];

GetPageRoute getNavRoutes(name) {
  Widget page;
  Bindings binding;
  Transition transition;
  switch (name) {
    case Routes.HOME:
      page = HomePage();
      binding = HomeBinding();
      break;
    case Routes.PROMO:
      page = PromoPage();
      binding = PromoBinding();
      break;
    case Routes.SUPPORT:
      page = SupportPage();
      binding = SupportBinding();
      break;
  }
  return GetPageRoute(
    page: () => page,
    binding: binding,
    transition: transition ?? Transition.fadeIn,
  );
}
