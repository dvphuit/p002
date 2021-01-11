import 'package:ku_app/core/data/models/base_model.dart';

class BaseResponse<T extends BaseModel> {
  final bool success;
  final dynamic message;
  T data;

  BaseResponse({this.success, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
      success: json["success"],
      message: json["message"] == null ? 'Unknown message' : json["message"],
      data: json['data'] == null ? null : _objAs<T>(json['data']));

  @override
  String toString() {
    return '{success: $success, message: $message, data: $data}';
  }
}

dynamic _objAs<T>(data) {
  Type type = T;
  switch (type) {
    // case Model:
    //   return Model.fromJson(json);
  }
  return null;
}
