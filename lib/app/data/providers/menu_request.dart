import 'package:ku_app/core/data/providers/remote/base_request.dart';

class MenuRequest extends BaseRequest {
  @override
  Method get method => Method.GET;

  @override
  Map<String, dynamic> get params => {};

  @override
  String get path => '/';

  @override
  Map<String, dynamic> get headers => {};
}
