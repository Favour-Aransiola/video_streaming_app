import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class DioFactory {
  final _dio = Dio();

  Dio getDio() {
    _dio.options = BaseOptions(headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'lanugauge': 'en'
    });
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true));
    }

    return _dio;
  }
}
