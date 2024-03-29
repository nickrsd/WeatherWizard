import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';

extension WeatherConditionExtension on WeatherCondition {
  static WeatherCondition fromCode(num code) {
    switch (code) {
      case 0:
        return WeatherCondition.clearSky;
      case 1:
      case 2:
      case 3:
        return WeatherCondition.mainlyClear;
      case 45:
      case 48:
        return WeatherCondition.fog;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.moderateRain;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.moderateSnowfall;
      default:
        return WeatherCondition.unknown;
    }
  }
}
