import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/di/dependencies_injection.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/theme.dart';

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
      darkTheme: Themes.light,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
