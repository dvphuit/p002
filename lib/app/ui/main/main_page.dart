import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/ui/main/main_controller.dart';
import 'package:ku_app/app/ui/widgets/bottom_nav.dart';

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
      body: Obx(
        () => IndexedStack(
          children: controller.menuPages,
          index: controller.navMenuIndex(),
        ),
      ),
      bottomNavigationBar: BottomNav(
        titles: screensData.map((e) => e.name).toList(),
        onNavClicked: (index) {
          controller.navMenuIndex.value = index;
          controller.title.value = screensData[index].name;
        },
      ),
    );
  }
}
//
// class PageColorList extends StatelessWidget {
//   final ScreenModel model;
//
//   const PageColorList({Key key, this.model}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(model.name), backgroundColor: model.colors),
//       body: ListView.builder(
//         itemBuilder: (_, idx) {
//           final shade = model.shades[idx];
//           return Container(
//             color: model.colors[shade],
//             child: ListTile(
//               title: Text(
//                 'shade [$shade]',
//                 style: Get.textTheme.bodyText2
//                     .copyWith(color: Colors.white, backgroundColor: Colors.black26),
//               ),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () => Get.find<MainController>().openDetails(shade),
//             ),
//           );
//         },
//         itemCount: model.shades.length,
//       ),
//     );
//   }
// }
//
// /// details of colors.
// class PageColorDetails extends StatelessWidget {
//   final String title;
//   final int shade;
//   final MaterialColor color;
//
//   const PageColorDetails({Key key, this.title, this.shade, this.color}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: color,
//       ),
//       backgroundColor: color[shade],
//       body: Center(
//         child: Text(
//           '$title [$shade]',
//           style: Get.textTheme.headline3.copyWith(
//             color: Colors.white,
//             backgroundColor: Colors.black45,
//           ),
//         ),
//       ),
//     );
//   }
// }
