import 'package:dio/dio.dart';
import 'package:simtaru/core/commons/static/status_code.dart';

class NetworkConnectionError extends DioError {
  NetworkConnectionError({required super.requestOptions})
      : super(
            error: "No Internet Connection",
            response: Response(
                statusCode: StatusCode.noInternetConnection,
                statusMessage: "No Internet Connection",
                requestOptions: requestOptions));
}
