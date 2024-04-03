import 'package:mocktail/mocktail.dart';
import 'package:weather_wizard/features/weather/data/models/weather_forecast.dart';
import 'package:weather_wizard/features/weather/data/models/weather_now.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_wizard/features/wizard/domain/repository/wizard_repository.dart';

class MockWizardRepository extends Mock implements WizardRepository {}

class MockWizardWeather extends Mock implements WeatherEntity {}

DailyForecast mockDailyForecast() => const DailyForecast(
    maxTemperature: 88,
    minTemperature: 56.3,
    condition: WeatherCondition.fog,
    time: '2024-03-31T02:30)');

HourlyForecast mockHourlyForecast() => const HourlyForecast(
    condition: WeatherCondition.thunderstormWithHeavyHail,
    temperature: 33.00,
    time: '2024-03-31T02:30)');

String mockUserSearch() => "Mt Doom of Middle Earth";

WeatherNow mockWeatherNow() => const WeatherNow(
    temperature: 74.6,
    relativeHumidity: 48,
    condition: WeatherCondition.clearSky,
    isDaytime: true,
    precipitationChance: 27,
    time: '2024-03-31T02:30');

WeatherEntity mockWeatherEntity() =>
    WeatherEntity(weatherNow: mockWeatherNow(), dailyForecast: [
      mockDailyForecast(),
      mockDailyForecast(),
      mockDailyForecast(),
      mockDailyForecast()
    ], hourlyForecast: [
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast(),
      mockHourlyForecast()
    ]);
