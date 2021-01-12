import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/config/consts.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  final spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppText.Home),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            headers,
            SliverPadding(
              padding: const EdgeInsets.only(top: 8),
            ),
            mainMenus,
          ],
        ).paddingSymmetric(horizontal: spacing, vertical: 8),
      ),
    );
  }

  Widget get headers => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _item(controller.headers[index]);
          },
          childCount: controller.headers.length,
        ),
      );

  Widget get mainMenus => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _item(controller.mainMenus[index]),
          childCount: controller.mainMenus.length,
        ),
      );

  Widget _item(Menu menu) => Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: InkWell(
            splashColor: Colors.blue,
            onTap: () => controller.takeAction(menu.route),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 16,
              children: [
                if (menu.icon != null)
                  Icon(
                    menu.icon,
                    size: 60,
                    color: Colors.blue,
                  ),
                Text(menu.title),
              ],
            ),
          ),
        ),
      );
}
