import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: _list,
      ),
    );
  }

  List<Widget> get _list => [
        _item("KU SPORT", "1"),
        _item("HỖ TRỢ 24H", "2"),
        _item("KHUYẾN MÃI", "3"),
        _item("GIỚI THIỆU", "4"),
        _item("LIÊN HỆ", "5"),
      ];

  Widget _item(String title, String action) => Container(
        child: Column(
          children: [Icon(Icons.insert_photo_outlined), Text(title)],
        ),
      );
}
