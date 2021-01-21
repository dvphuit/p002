import 'dart:convert';

import 'package:ku_app/core/data/models/base_model.dart';

MenuResponse menuResponseFromJson(String str) => MenuResponse.fromJson(json.decode(str));

class MenuResponse extends BaseModel {
  MenuResponse({
    this.status,
    this.resultCode,
    this.description,
    this.ata,
    this.data,
    this.release_mode = false,
  });

  String status;
  int resultCode;
  String description;
  dynamic ata;
  bool release_mode;
  List<MenuModel> data;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
        status: json["status"] == null ? null : json["status"],
        resultCode: json["resultCode"] == null ? null : json["resultCode"],
        description: json["description"] == null ? null : json["description"],
        release_mode: json["release_mode"] == null ? null : json["release_mode"],
        ata: json["ata"],
        data: json["data"] == null ? null : List<MenuModel>.from(json["data"].map((x) => MenuModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "resultCode": resultCode == null ? null : resultCode,
        "description": description == null ? null : description,
        "ata": ata,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MenuModel {
  MenuModel({
    this.id,
    this.tieuDe,
    this.tieuDeKd,
    this.title,
    this.urlHinh,
    this.des,
  });

  String id;
  String tieuDe;
  String tieuDeKd;
  String title;
  String urlHinh;
  String des;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"] == null ? null : json["id"],
        tieuDe: json["TieuDe"] == null ? null : json["TieuDe"],
        tieuDeKd: json["TieuDeKD"] == null ? null : json["TieuDeKD"],
        title: json["Title"] == null ? null : json["Title"],
        urlHinh: json["UrlHinh"] == null ? null : json["UrlHinh"],
        des: json["Des"] == null ? null : json["Des"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "TieuDe": tieuDe == null ? null : tieuDe,
        "TieuDeKD": tieuDeKd == null ? null : tieuDeKd,
        "Title": title == null ? null : title,
        "UrlHinh": urlHinh == null ? null : urlHinh,
        "Des": des == null ? null : des,
      };
}
