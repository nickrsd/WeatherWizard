import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_now.dart';

class WeatherNow extends WeatherNowEntity {
  const WeatherNow(
      {super.temperature,
      super.relativeHumidity,
      super.condition,
      super.isDaytime,
      super.precipitationChance,
      super.time});

  @override
  List<Object?> get props => [
        temperature,
        relativeHumidity,
        condition,
        isDaytime,
        precipitationChance,
        time
      ];

  factory WeatherNow.fromJson(Map<String, dynamic> json) {
    final {
      'temperature_2m': num temp,
      'relative_humidity_2m': num relativeHumidity,
      'weather_code': num weatherCode,
      'is_day': int isDayNumber,
      'precipitation_probability': num precipitationChance,
      'time': String time
    } = json;

    return WeatherNow(
        temperature: temp,
        relativeHumidity: relativeHumidity,
        condition: WeatherConditionExtension.fromCode(weatherCode),
        isDaytime: isDayNumber == 1,
        precipitationChance: precipitationChance,
        time: time //precipitationChance,
        );
  }
}
