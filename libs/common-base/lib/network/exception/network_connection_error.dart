import 'package:common_base/static/status_code.dart';
import 'package:dio/dio.dart';

class NetworkConnectionError extends DioError {
  NetworkConnectionError({required super.requestOptions})
      : super(
            error: "No Internet Connection",
            response: Response(
                statusCode: StatusCode.noInternetConnection,
                statusMessage: "No Internet Connection",
                requestOptions: requestOptions));
}
