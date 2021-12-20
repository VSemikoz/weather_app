import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WeatherClient {
  static const baseUrl = "api.openweathermap.org/data/2.5/onecall";
  static const _connectTimeoutMS = 10000;
  static const _receiveTimeoutMS = 10000;

  Dio create() {
    final Dio client = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: _connectTimeoutMS,
        receiveTimeout: _receiveTimeoutMS,
      ),
    );
    client.interceptors.addAll([
      if (!kReleaseMode) LogInterceptor(requestBody: true, responseBody: true),
    ]);

    return client;
  }
}
