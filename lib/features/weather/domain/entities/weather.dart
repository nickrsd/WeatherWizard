import 'package:equatable/equatable.dart';

import 'package:weather_wizard/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_now.dart';

class WeatherEntity extends Equatable {
  final WeatherNowEntity? weatherNow;
  final List<DailyForecastEntity> dailyForecast;
  final List<HourlyForecastEntity> hourlyForecast;

  const WeatherEntity(
      {this.weatherNow,
      this.dailyForecast = const [],
      this.hourlyForecast = const []});

  @override
  List<Object?> get props => [
        weatherNow,
        dailyForecast,
        hourlyForecast,
      ];
}
