import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/weather.dart';
import '../models/weather.dart';

abstract class GetWeatherUseCase {
  Future<Either<WeatherData, Exception>> call();
}

@Injectable(as: GetWeatherUseCase)
class GetWeatherUseCaseImpl extends GetWeatherUseCase {
  GetWeatherRepository _repository;

  GetWeatherUseCaseImpl(this._repository);

  @override
  Future<Either<WeatherData, Exception>> call() => _repository.getWeather();
}
