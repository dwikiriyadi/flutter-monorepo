import 'package:dio/dio.dart';

class DioClient {
  late Dio client;

  DioClient(String baseUrl) {
    client = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ));
  }

  DioClient config(Function(Dio client) configuration) {
    configuration(client);
    return this;
  }

  DioClient addInterceptor(Interceptor? element) {
    if (element != null) client.interceptors.add(element);
    return this;
  }

  Dio build() => client;
}
