import 'package:injectable/injectable.dart';

import '../../data/repository/weather.dart';

abstract class GetWeatherUseCase {
  Future call();
}

@Injectable(as: GetWeatherUseCase)
class GetWeatherUseCaseImpl extends GetWeatherUseCase {
  GetWeatherRepository _repository;

  GetWeatherUseCaseImpl(this._repository);

  @override
  Future call() => _repository.getWeather();
}
