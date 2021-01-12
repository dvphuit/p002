import 'package:get/get.dart';
import 'package:ku_app/core/data/models/base_model.dart';
import 'package:ku_app/core/data/response/base_response.dart';
import 'package:meta/meta.dart';

typedef void OnSuccess<T extends BaseModel>(T data);
typedef void OnError(dynamic message);

enum Method {
  GET,
  POST,
}

abstract class BaseRequest extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.covid19api.com';
    httpClient.maxAuthRetries = 3;
  }

  String get path;

  Method get method;

  Map<String, dynamic> get params;

  Map<String, dynamic> get headers;

  Future<void> send<T extends BaseModel>({
    @required OnSuccess onSuccess,
    @required OnError onError,
  }) async {
    final Response res = await _getResponse();
    print("Response of request: $res");
    try {
      var result = BaseResponse.fromJson(res.body);
      if (result.success)
        onSuccess?.call(result.data);
      else
        onError?.call(result.message);
    } catch (e) {
      print(e);
      onError?.call('parse json error');
    }
  }

  Future<Response> _getResponse() async {
    try {
      switch (method) {
        case Method.GET:
          return await get(path, query: params);
        case Method.POST:
          return await post(path, params);
        default:
          throw Exception('No such available methods');
      }
    } on Exception catch (e) {
      return Response(body: {
        'status': false,
        'message': e,
      });
    }
  }
}
