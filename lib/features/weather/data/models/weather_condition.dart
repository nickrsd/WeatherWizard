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

  static String backgroundPath(WeatherCondition condition, bool isDaytime) {
    switch (condition) {
      case WeatherCondition.clearSky:
        return isDaytime
            ? "weather_clearskies_animated.gif"
            : "weather_clearskies_night_animated.gif";
      case WeatherCondition.mainlyClear:
        return isDaytime
            ? "weather_clearskies_animated.gif"
            : "weather_clearskies_night_animated.gif";
      case WeatherCondition.partlyCloudy:
      case WeatherCondition.overcast:
      case WeatherCondition.fog:
        return "weather_foggy_animated.gif";

      case WeatherCondition.lightDrizzle:
      case WeatherCondition.moderateDrizzle:
      case WeatherCondition.denseDrizzle:
      case WeatherCondition.lightFreezingDrizzle:
      case WeatherCondition.denseFreezingDrizzle:
      case WeatherCondition.lightRain:
      case WeatherCondition.moderateRain:
        return "rainy.gif";
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightFreezingRain:
      case WeatherCondition.heavyFreezingRain:
      case WeatherCondition.slightRainShowers:
      case WeatherCondition.moderateRainShowers:
      case WeatherCondition.violentRainShowers:
      case WeatherCondition.slightThunderstorm:
      case WeatherCondition.moderateThunderstorm:
      case WeatherCondition.thunderstormWithLightHail:
      case WeatherCondition.thunderstormWithHeavyHail:
        return "weather_storm.gif";

      case WeatherCondition.lightSnowfall:
      case WeatherCondition.moderateSnowfall:
      case WeatherCondition.heavySnowfall:
      case WeatherCondition.snowGrains:
      case WeatherCondition.slightSnowShowers:
      case WeatherCondition.heavySnowShowers:
        return "weather_snowy_day.gif";
      case WeatherCondition.unknown:
        return "quiet_flame.gif";
    }
  }

  static String imagePath(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clearSky:
        return "pixel_status_sunny.png";
      case WeatherCondition.mainlyClear:
        return "pixel_status_sunny.png";
      case WeatherCondition.partlyCloudy:
      case WeatherCondition.overcast:
      case WeatherCondition.fog:
        return "pixel_status_cloudy.png";

      case WeatherCondition.lightDrizzle:
      case WeatherCondition.moderateDrizzle:
        return "pixel_status_windy.png";
      case WeatherCondition.denseDrizzle:
      case WeatherCondition.lightFreezingDrizzle:
      case WeatherCondition.denseFreezingDrizzle:
      case WeatherCondition.lightRain:
      case WeatherCondition.moderateRain:
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightFreezingRain:
      case WeatherCondition.heavyFreezingRain:
      case WeatherCondition.slightRainShowers:
        return "pixel_status_rain.png";

      case WeatherCondition.lightSnowfall:
      case WeatherCondition.moderateSnowfall:
      case WeatherCondition.heavySnowfall:
      case WeatherCondition.snowGrains:
      case WeatherCondition.slightSnowShowers:
      case WeatherCondition.heavySnowShowers:
        return "pixel_status_snow.png";

      case WeatherCondition.moderateRainShowers:
      case WeatherCondition.violentRainShowers:
      case WeatherCondition.slightThunderstorm:
      case WeatherCondition.moderateThunderstorm:
      case WeatherCondition.thunderstormWithLightHail:
      case WeatherCondition.thunderstormWithHeavyHail:
      case WeatherCondition.unknown:
        return "pixel_status_thunder.png";
    }
  }
}
