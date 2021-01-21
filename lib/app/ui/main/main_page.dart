import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/ui/widgets/bottom_nav.dart';

import 'main_controller.dart';
import 'nav_page.dart';

class MainPage extends GetWidget<MainController> {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _home();
  }

  Widget _home() {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        automaticallyImplyLeading: false,
        actions: [],
      ),
      // body: Obx(
      //   () => IndexedStack(
      //     children: controller.menuPages,
      //     index: controller.navMenuIndex(),
      //   ),
      // ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: navPages.first.route,
        onGenerateRoute: (settings) {
          return getNavRoutes(settings.name);
        },
      ),
      bottomNavigationBar: BottomNav(
        titles: navPages.map((e) => e.title).toList(),
        onNavClicked: (index) {
          controller.onNavClick(index);
        },
      ),
    );
  }
}
