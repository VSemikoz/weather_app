import 'package:injectable/injectable.dart';

import '../../domain/mappers/weather.dart';
import '../network/api/weather.dart';

abstract class GetWeatherRepository {
  Future getWeather();
}

@Injectable(as: GetWeatherRepository)
class GetWeatherRepositoryImpl extends GetWeatherRepository {
  final WeatherApi _api;

  GetWeatherRepositoryImpl(this._api);

  @override
  Future getWeather() async {
    final res = await _api.getWeather();
    return res.toWeather();
  }
}
