import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _gotoTerm(), // async work
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: Text("Splash"));
          else
            return Container();
        },
      ),
    );
  }

  Future<bool> _gotoTerm() async {
    await Future.delayed(Duration(microseconds: 2500));
    print('go to term of use');
    Get.offNamed(Routes.TERM_OF_USE);
    return true;
  }
}
