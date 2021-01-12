import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/config/consts.dart';
import 'package:ku_app/routes/app_routes.dart';

class TermOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.Term_of_use),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text('Term of use')),
            RaisedButton(
              child: Text('Accept'),
              onPressed: () {
                Get.offNamed(Routes.HOME);
              },
            )
          ],
        ),
      ),
    );
  }
}
