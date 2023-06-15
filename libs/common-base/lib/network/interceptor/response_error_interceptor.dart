import 'package:dio/dio.dart';

class ResponseErrorInterceptor extends Interceptor {
  final DioException Function(Response response) callback;

  ResponseErrorInterceptor(this.callback);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      handler.reject(callback(response));
    } else {
      handler.next(response);
    }
  }
}
