import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/weather.dart';

const String url = "/onecall";

abstract class WeatherApi {
  Future<GetWeatherResponse> getWeather();
}

@Injectable(as: WeatherApi)
class WeatherApiImpl extends WeatherApi {
  final Dio _client;

  WeatherApiImpl(this._client);

  @override
  Future<GetWeatherResponse> getWeather() async {
    final response = await _client.get(
      url,
      queryParameters: {
        "lat": '33.44',
        "lon": '-94.04',
        "lang": 'ru',
        "units": 'metric',
      },
    );
    return GetWeatherResponse.fromMap(response.data);
  }
}
