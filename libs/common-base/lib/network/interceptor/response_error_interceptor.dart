import 'package:dio/dio.dart';

class ResponseErrorInterceptor extends Interceptor {
  final Response Function(Response response, ResponseInterceptorHandler handler)
      callback;

  ResponseErrorInterceptor(this.callback);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      callback(response, handler);
    } else {
      handler.next(response);
    }
  }
}
