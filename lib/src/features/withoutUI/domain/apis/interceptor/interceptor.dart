import 'package:dio/dio.dart';
import 'package:kkiapay_flutter_sdk/src/utils/extension.dart';

class PaymentInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
     response.requestOptions.uri.toString().i();
     response.data.toString().i();
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var res = err.response;
    "AppInterceptor::: onError: ${res?.requestOptions.baseUrl} -> "
            "${res?.requestOptions.uri} -> ${res?.statusCode} -> "
            "${res?.statusMessage} -> ${res?.data} "
        .i();
    super.onError(err, handler);
  }
}
