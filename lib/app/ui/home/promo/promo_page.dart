import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Promo'),
        ),
        body: Center(
          child: Text('Promotion'),
        ),
      ),
    );
  }
}
