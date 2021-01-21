import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/routes/app_routes.dart';

import 'nav_page.dart';

/// screen model
class ScreenModel {
  final String name;
  final String route;
  final int navKey;
  ScreenModel({this.name, this.route, this.navKey});
}

/// screens models list
final screensData = <ScreenModel>[
  ScreenModel(name: 'TOOL', route: Routes.HOME, navKey: 1),
  ScreenModel(name: 'HOME', route: Routes.PROMO, navKey: 2),
  ScreenModel(name: 'SUPPORT', route: Routes.SUPPORT, navKey: 3),
];

class MainController extends GetxController {
  var title = navPages[0].title.obs;
//#############################################

  final navMenuIndex = 0.obs;

  ScreenModel get currentScreenModel => screensData[navMenuIndex()];

  // store the pages stack.
  List<Widget> _pages;

  // get navigators.
  List<Widget> get menuPages => _pages ??= screensData.map((e) => _TabNav(e)).toList();
}

/// sub navigators.
class _TabNav extends GetView<MainController> {
  final ScreenModel model;
  _TabNav(this.model);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(model.navKey),
      onGenerateRoute: (settings) => getNavRoutes(model.route),
    );
  }
}
