import 'package:ku_app/core/data/models/base_model.dart';

class MenuModel extends BaseModel {
  final String iconUrl;
  final String title;
  final String route;

  MenuModel({this.iconUrl, this.title, this.route});

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        iconUrl: json['icon_url'],
        title: json['title'],
        route: json['url'],
      );
}
