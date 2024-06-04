import 'package:common_base/utils/environment.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';

class CustomLogInterceptor {
  static LoggyDioInterceptor? call({
    bool requestHeader = true,
    bool requestBody = true,
    bool responseHeader = false,
    bool responseBody = true,
    bool error = true,
    int maxWidth = 90,
    LogLevel requestLevel = LogLevel.info,
    LogLevel responseLevel = LogLevel.info,
    LogLevel errorLevel = LogLevel.error,
  }) {
    if (Environment.isDevelopment()) {
      return LoggyDioInterceptor(
        requestBody: requestBody,
        requestHeader: requestHeader,
        requestLevel: requestLevel,
        responseHeader: responseHeader,
        responseLevel: responseLevel,
        responseBody: responseBody,
        error: error,
        errorLevel: errorLevel,
        maxWidth: maxWidth,
      );
    } else {
      return null;
    }
  }
}
