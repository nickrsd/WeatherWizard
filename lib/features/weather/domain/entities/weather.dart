import 'package:equatable/equatable.dart';

import 'weather_forecast.dart';
import 'weather_now.dart';

class WeatherEntity extends Equatable {
  final WeatherNowEntity? weatherNow;
  final List<DailyForecastEntity> dailyWeatherData;
  final List<HourlyForecastEntity> hourlyWeatherData;

  const WeatherEntity(
      {this.weatherNow,
      this.dailyWeatherData = const [],
      this.hourlyWeatherData = const []});

  @override
  List<Object?> get props => [
        weatherNow,
        dailyWeatherData,
        hourlyWeatherData,
      ];
}
