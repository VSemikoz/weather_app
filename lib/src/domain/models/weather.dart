class WeatherData {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;
  final List<Alerts> alerts;

  const WeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherData &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lon == other.lon &&
          timezone == other.timezone &&
          timezoneOffset == other.timezoneOffset &&
          current == other.current &&
          minutely == other.minutely &&
          hourly == other.hourly &&
          daily == other.daily &&
          alerts == other.alerts);

  @override
  int get hashCode =>
      lat.hashCode ^
      lon.hashCode ^
      timezone.hashCode ^
      timezoneOffset.hashCode ^
      current.hashCode ^
      minutely.hashCode ^
      hourly.hashCode ^
      daily.hashCode ^
      alerts.hashCode;

  @override
  String toString() {
    return 'WeatherData{' +
        ' lat: $lat,' +
        ' lon: $lon,' +
        ' timezone: $timezone,' +
        ' timezoneOffset: $timezoneOffset,' +
        ' current: $current,' +
        ' minutely: $minutely,' +
        ' hourly: $hourly,' +
        ' daily: $daily,' +
        ' alerts: $alerts,' +
        '}';
  }

  WeatherData copyWith({
    double? lat,
    double? lon,
    String? timezone,
    int? timezoneOffset,
    Current? current,
    List<Minutely>? minutely,
    List<Hourly>? hourly,
    List<Daily>? daily,
    List<Alerts>? alerts,
  }) {
    return WeatherData(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      current: current ?? this.current,
      minutely: minutely ?? this.minutely,
      hourly: hourly ?? this.hourly,
      daily: daily ?? this.daily,
      alerts: alerts ?? this.alerts,
    );
  }
}

class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final double? rain;
  final double? snow;
  final List<Weather> weather;

  const Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    this.rain,
    this.snow,
    required this.weather,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Current &&
          runtimeType == other.runtimeType &&
          dt == other.dt &&
          sunrise == other.sunrise &&
          sunset == other.sunset &&
          temp == other.temp &&
          feelsLike == other.feelsLike &&
          pressure == other.pressure &&
          humidity == other.humidity &&
          dewPoint == other.dewPoint &&
          uvi == other.uvi &&
          clouds == other.clouds &&
          visibility == other.visibility &&
          windSpeed == other.windSpeed &&
          windDeg == other.windDeg &&
          windGust == other.windGust &&
          rain == other.rain &&
          snow == other.snow &&
          weather == other.weather);

  @override
  int get hashCode =>
      dt.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode ^
      temp.hashCode ^
      feelsLike.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      dewPoint.hashCode ^
      uvi.hashCode ^
      clouds.hashCode ^
      visibility.hashCode ^
      windSpeed.hashCode ^
      windDeg.hashCode ^
      windGust.hashCode ^
      rain.hashCode ^
      snow.hashCode ^
      weather.hashCode;

  @override
  String toString() {
    return 'Current{' +
        ' dt: $dt,' +
        ' sunrise: $sunrise,' +
        ' sunset: $sunset,' +
        ' temp: $temp,' +
        ' feelsLike: $feelsLike,' +
        ' pressure: $pressure,' +
        ' humidity: $humidity,' +
        ' dewPoint: $dewPoint,' +
        ' uvi: $uvi,' +
        ' clouds: $clouds,' +
        ' visibility: $visibility,' +
        ' windSpeed: $windSpeed,' +
        ' windDeg: $windDeg,' +
        ' windGust: $windGust,' +
        ' rain: $rain,' +
        ' snow: $snow,' +
        ' weather: $weather,' +
        '}';
  }

  Current copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    double? rain,
    double? snow,
    List<Weather>? weather,
  }) {
    return Current(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      weather: weather ?? this.weather,
    );
  }
}

class Minutely {
  final int dt;
  final int precipitation;

  const Minutely({
    required this.dt,
    required this.precipitation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Minutely &&
          runtimeType == other.runtimeType &&
          dt == other.dt &&
          precipitation == other.precipitation);

  @override
  int get hashCode => dt.hashCode ^ precipitation.hashCode;

  @override
  String toString() {
    return 'Minutely{' + ' dt: $dt,' + ' precipitation: $precipitation,' + '}';
  }

  Minutely copyWith({
    int? dt,
    int? precipitation,
  }) {
    return Minutely(
      dt: dt ?? this.dt,
      precipitation: precipitation ?? this.precipitation,
    );
  }
}

class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final double? rain;
  final double? snow;
  final List<Weather> weather;
  final int pop;

  const Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    this.rain,
    this.snow,
    required this.weather,
    required this.pop,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hourly &&
          runtimeType == other.runtimeType &&
          dt == other.dt &&
          temp == other.temp &&
          feelsLike == other.feelsLike &&
          pressure == other.pressure &&
          humidity == other.humidity &&
          dewPoint == other.dewPoint &&
          uvi == other.uvi &&
          clouds == other.clouds &&
          visibility == other.visibility &&
          windSpeed == other.windSpeed &&
          windDeg == other.windDeg &&
          windGust == other.windGust &&
          rain == other.rain &&
          snow == other.snow &&
          weather == other.weather &&
          pop == other.pop);

  @override
  int get hashCode =>
      dt.hashCode ^
      temp.hashCode ^
      feelsLike.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      dewPoint.hashCode ^
      uvi.hashCode ^
      clouds.hashCode ^
      visibility.hashCode ^
      windSpeed.hashCode ^
      windDeg.hashCode ^
      windGust.hashCode ^
      rain.hashCode ^
      snow.hashCode ^
      weather.hashCode ^
      pop.hashCode;

  @override
  String toString() {
    return 'Hourly{' +
        ' dt: $dt,' +
        ' temp: $temp,' +
        ' feelsLike: $feelsLike,' +
        ' pressure: $pressure,' +
        ' humidity: $humidity,' +
        ' dewPoint: $dewPoint,' +
        ' uvi: $uvi,' +
        ' clouds: $clouds,' +
        ' visibility: $visibility,' +
        ' windSpeed: $windSpeed,' +
        ' windDeg: $windDeg,' +
        ' windGust: $windGust,' +
        ' rain: $rain,' +
        ' snow: $snow,' +
        ' weather: $weather,' +
        ' pop: $pop,' +
        '}';
  }

  Hourly copyWith({
    int? dt,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    double? rain,
    double? snow,
    List<Weather>? weather,
    int? pop,
  }) {
    return Hourly(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      weather: weather ?? this.weather,
      pop: pop ?? this.pop,
    );
  }
}

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double uvi;
  final double? rain;
  final double? snow;

  const Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    this.rain,
    this.snow,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Daily &&
          runtimeType == other.runtimeType &&
          dt == other.dt &&
          sunrise == other.sunrise &&
          sunset == other.sunset &&
          moonrise == other.moonrise &&
          moonset == other.moonset &&
          moonPhase == other.moonPhase &&
          temp == other.temp &&
          feelsLike == other.feelsLike &&
          pressure == other.pressure &&
          humidity == other.humidity &&
          dewPoint == other.dewPoint &&
          windSpeed == other.windSpeed &&
          windDeg == other.windDeg &&
          windGust == other.windGust &&
          weather == other.weather &&
          clouds == other.clouds &&
          pop == other.pop &&
          uvi == other.uvi &&
          rain == other.rain &&
          snow == other.snow);

  @override
  int get hashCode =>
      dt.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      moonPhase.hashCode ^
      temp.hashCode ^
      feelsLike.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      dewPoint.hashCode ^
      windSpeed.hashCode ^
      windDeg.hashCode ^
      windGust.hashCode ^
      weather.hashCode ^
      clouds.hashCode ^
      pop.hashCode ^
      uvi.hashCode ^
      rain.hashCode ^
      snow.hashCode;

  @override
  String toString() {
    return 'Daily{' +
        ' dt: $dt,' +
        ' sunrise: $sunrise,' +
        ' sunset: $sunset,' +
        ' moonrise: $moonrise,' +
        ' moonset: $moonset,' +
        ' moonPhase: $moonPhase,' +
        ' temp: $temp,' +
        ' feelsLike: $feelsLike,' +
        ' pressure: $pressure,' +
        ' humidity: $humidity,' +
        ' dewPoint: $dewPoint,' +
        ' windSpeed: $windSpeed,' +
        ' windDeg: $windDeg,' +
        ' windGust: $windGust,' +
        ' weather: $weather,' +
        ' clouds: $clouds,' +
        ' pop: $pop,' +
        ' uvi: $uvi,' +
        ' rain: $rain,' +
        ' snow: $snow,' +
        '}';
  }

  Daily copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    double? moonPhase,
    Temp? temp,
    FeelsLike? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
    int? clouds,
    double? pop,
    double? uvi,
    double? rain,
    double? snow,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
      uvi: uvi ?? this.uvi,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
    );
  }
}

class Alerts {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;
  final List<String> tags;

  const Alerts({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alerts &&
          runtimeType == other.runtimeType &&
          senderName == other.senderName &&
          event == other.event &&
          start == other.start &&
          end == other.end &&
          description == other.description &&
          tags == other.tags);

  @override
  int get hashCode =>
      senderName.hashCode ^
      event.hashCode ^
      start.hashCode ^
      end.hashCode ^
      description.hashCode ^
      tags.hashCode;

  @override
  String toString() {
    return 'Alerts{' +
        ' senderName: $senderName,' +
        ' event: $event,' +
        ' start: $start,' +
        ' end: $end,' +
        ' description: $description,' +
        ' tags: $tags,' +
        '}';
  }

  Alerts copyWith({
    String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
    List<String>? tags,
  }) {
    return Alerts(
      senderName: senderName ?? this.senderName,
      event: event ?? this.event,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weather &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          main == other.main &&
          description == other.description &&
          icon == other.icon);

  @override
  int get hashCode => id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;

  @override
  String toString() {
    return 'Weather{' + ' id: $id,' + ' main: $main,' + ' description: $description,' + ' icon: $icon,' + '}';
  }

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  const Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Temp &&
          runtimeType == other.runtimeType &&
          day == other.day &&
          min == other.min &&
          max == other.max &&
          night == other.night &&
          eve == other.eve &&
          morn == other.morn);

  @override
  int get hashCode =>
      day.hashCode ^ min.hashCode ^ max.hashCode ^ night.hashCode ^ eve.hashCode ^ morn.hashCode;

  @override
  String toString() {
    return 'Temp{' +
        ' day: $day,' +
        ' min: $min,' +
        ' max: $max,' +
        ' night: $night,' +
        ' eve: $eve,' +
        ' morn: $morn,' +
        '}';
  }

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }
}

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  const FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeelsLike &&
          runtimeType == other.runtimeType &&
          day == other.day &&
          night == other.night &&
          eve == other.eve &&
          morn == other.morn);

  @override
  int get hashCode => day.hashCode ^ night.hashCode ^ eve.hashCode ^ morn.hashCode;

  @override
  String toString() {
    return 'FeelsLike{' + ' day: $day,' + ' night: $night,' + ' eve: $eve,' + ' morn: $morn,' + '}';
  }

  FeelsLike copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return FeelsLike(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }
}
