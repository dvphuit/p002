import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnNavClicked = Function(int index);

class BottomNav extends StatelessWidget {
  final List<String> titles;
  final OnNavClicked onNavClicked;
  final BottomNavController _controller = Get.put(BottomNavController());

  BottomNav({Key key, @required this.titles, this.onNavClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var selectedIndex = _controller.selectedIndex.value;
      return Container(
        width: double.infinity,
        height: 50,
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: titles
              .asMap()
              .map((index, value) => MapEntry(index, _item(index, selectedIndex == index)))
              .values
              .toList(),
        ),
      );
    });
  }

  Widget _item(int index, bool isSelected) {
    return InkWell(
      child: Container(
        height: 50,
        width: Get.width / titles.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titles[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.normal,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              width: isSelected ? 5 : 0,
              height: isSelected ? 5 : 0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        _controller.selectedIndex.value = index;
        onNavClicked.call(index);
      },
    );
  }
}

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
}
