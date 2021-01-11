import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/core/widgets/dark_light_switch.dart';

import 'core/theme/theme.dart';
import 'core/theme/theme_service.dart';
import 'di/dependencies_injection.dart';
import 'routes/app_pages.dart';

void main() async {
  await DependenciesInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KuApp',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: Get.find<ThemeService>().theme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.pages,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          children: [DarkLightSwitch()],
        ),
      ),
    );
  }
}
