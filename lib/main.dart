import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/theme.dart';
import 'core/theme/theme_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KuApp',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: MyHomePage(),
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
          children: [
            RaisedButton(
              onPressed: () {
                if (Get.isDarkMode)
                  Get.changeThemeMode(ThemeMode.light);
                else
                  Get.changeThemeMode(ThemeMode.dark);
              },
              child: Text("dark mode"),
            )
          ],
        ),
      ),
    );
  }
}
