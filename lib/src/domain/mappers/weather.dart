import 'package:weather_app/src/data/models/weather.dart';
import 'package:weather_app/src/domain/models/weather.dart';

extension GetWeatherResponseExtension on GetWeatherResponse {
  WeatherData toWeather() {
    return WeatherData(
      lat: lat,
      lon: lon,
      timezone: timezone,
      timezoneOffset: timezoneOffset,
      current: current.getCurrent(),
      minutely: minutely.map((e) => e.getMinutely()).toList(),
      hourly: hourly.map((e) => e.getHourly()).toList(),
      daily: daily.map((e) => e.getDaily()).toList(),
      alerts: alerts.map((e) => e.getAlerts()).toList(),
    );
  }
}

extension CurrentResponseExtension on CurrentResponse {
  Current getCurrent() {
    return Current(
      dt: dt,
      sunrise: sunrise,
      sunset: sunset,
      temp: temp,
      feelsLike: feelsLike,
      pressure: pressure,
      humidity: humidity,
      dewPoint: dewPoint,
      uvi: uvi,
      clouds: clouds,
      visibility: visibility,
      windSpeed: windSpeed,
      windDeg: windDeg,
      weather: weather.map((e) => e.getWeather()).toList(),
    );
  }
}

extension MinutelyResponseExtension on MinutelyResponse {
  Minutely getMinutely() => Minutely(dt: dt, precipitation: precipitation);
}

extension HourlyResponseExtension on HourlyResponse {
  Hourly getHourly() => Hourly(
        dt: dt,
        temp: temp,
        feelsLike: feelsLike,
        pressure: pressure,
        humidity: humidity,
        dewPoint: dewPoint,
        uvi: uvi,
        clouds: clouds,
        visibility: visibility,
        windSpeed: windSpeed,
        windDeg: windDeg,
        weather: weather.map((e) => e.getWeather()).toList(),
        pop: pop,
      );
}

extension DailyResponseExtension  on DailyResponse {
  Daily getDaily() => Daily(
        dt: dt,
        sunrise: sunrise,
        sunset: sunset,
        moonrise: moonrise,
        moonset: moonset,
        moonPhase: moonPhase,
        temp: temp.getTemp(),
        feelsLike: feelsLike.getFeelsLike(),
        pressure: pressure,
        humidity: humidity,
        dewPoint: dewPoint,
        windSpeed: windSpeed,
        windDeg: windDeg,
        weather: weather.map((e) => e.getWeather()).toList(),
        clouds: clouds,
        pop: pop,
        uvi: uvi,
      );
}

extension AlertsResponseExtension on AlertsResponse {
  Alerts getAlerts() => Alerts(
        senderName: senderName,
        event: event,
        start: start,
        end: end,
        description: description,
        tags: tags,
      );
}

extension WeatherResponseExtension on WeatherResponse {
  Weather getWeather() => Weather(id: id, main: main, description: description, icon: icon);
}

extension TempResponseExtension  on TempResponse {
  Temp getTemp() => Temp(day: day, min: min, max: max, night: night, eve: eve, morn: morn);
}

extension FeelsLikeResponseExtension on FeelsLikeResponse {
  FeelsLike getFeelsLike() => FeelsLike(day: day, night: night, eve: eve, morn: morn);
}
