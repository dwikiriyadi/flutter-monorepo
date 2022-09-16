import 'package:dio/dio.dart';

class NetworkConnectionError extends DioError {
  NetworkConnectionError({required super.requestOptions})
      : super(
            error: "No Internet Connection",
            response: Response(
                statusCode: 1,
                statusMessage: "No Internet Connection",
                requestOptions: requestOptions));
}
