import 'package:common_base/network/network_checker.dart';
import 'package:common_base/network/exception/network_connection_error.dart';
import 'package:dio/dio.dart';

class NetworkCheckInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await NetworkChecker.isConnected()) {
      handler.next(options);
    } else {
      handler.reject(NetworkConnectionError(requestOptions: options));
    }
  }
}
