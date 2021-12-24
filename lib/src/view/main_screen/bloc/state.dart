import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/models/weather.dart';

part 'state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.loading() = MainStateLoading;

  const factory MainState.success(WeatherData weatherData) = MainStateSuccess;

  const factory MainState.failure() = MainStateFailure;
}
