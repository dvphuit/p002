import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_service.dart';

class DarkLightSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DarkLightSwitch> {
  final theme = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Dark mode'),
        Switch(
          value: theme.isDarkMode,
          onChanged: (state) {
            theme.switchTheme();
            setState(() {});
          },
        )
      ],
    );
  }
}
