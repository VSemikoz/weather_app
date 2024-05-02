import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/domain/models/weather.dart';

import '../../domain/mappers/weather.dart';
import '../network/api/weather.dart';

abstract class GetWeatherRepository {
  Future<Either<WeatherData, Exception>> getWeather();
}

@Injectable(as: GetWeatherRepository)
class GetWeatherRepositoryImpl extends GetWeatherRepository {
  final WeatherApi _api;

  GetWeatherRepositoryImpl(this._api);

  @override
  Future<Either<WeatherData, Exception>> getWeather() async {
    final res = await _api.getWeather();
    return Left(res.toWeather());
    //TODO capture errors
  }
}
