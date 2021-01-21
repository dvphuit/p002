import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _gotoTerm(), // async work
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          );
        },
      ),
    );
  }

  Future<bool> _gotoTerm() async {
    if (ku_mode) Get.offNamed(Routes.MAIN);

    await Future.delayed(Duration(microseconds: 1000));
    final box = GetStorage();
    final isAcceptedTerm = box.read('is_accepted') ?? false;
    Get.offNamed(isAcceptedTerm ? Routes.MAIN : Routes.TERM_OF_USE);
    return true;
  }
}
