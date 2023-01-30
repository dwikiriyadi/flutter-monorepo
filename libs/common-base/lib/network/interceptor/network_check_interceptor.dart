import 'package:dio/dio.dart';
import 'package:simtaru/core/commons/network/exception/network_connection_error.dart';
import 'package:simtaru/core/commons/network/network_checker.dart';

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
