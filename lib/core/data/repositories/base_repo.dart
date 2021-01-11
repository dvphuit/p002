import 'package:ku_app/core/data/models/base_model.dart';
import 'package:ku_app/core/data/providers/remote/base_request.dart';

abstract class BaseRepo {
  OnSuccess onSuccess;
  OnError onError;

  void setOnSuccess(OnSuccess onSuccess) {
    this.onSuccess = onSuccess;
  }

  void setOnError(OnError onError) {
    this.onError = onError;
  }

  Future<void> send<T extends BaseModel>(BaseRequest api) async {
    await api.send<T>(onSuccess: onSuccess, onError: onError);
    onSuccess = null;
    onError = null;
  }
}
