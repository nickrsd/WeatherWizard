import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_wizard/features/weather/data/models/weather_now.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';

void main() {
  group('Testing fromJson', () {
    test("creating valid weather_now", () {
      const validWeatherNowString =
          '{"time":"2024-03-26T04:30","interval":900,"temperature_2m":54.3,"relative_humidity_2m":45,"apparent_temperature":46.5,"is_day":1,"weather_code":1, "precipitation_probability":33}';
      final validWeatherNowJson =
          jsonDecode(validWeatherNowString) as Map<String, dynamic>;
      final weatherFromJson = WeatherNow.fromJson(validWeatherNowJson);
      const matchingWeather = WeatherNow(
          condition: WeatherCondition.mainlyClear,
          temperature: 54.3,
          relativeHumidity: 45,
          isDaytime: true,
          precipitationChance: 33,
          time: "2024-03-26T04:30");

      expect(weatherFromJson == matchingWeather, true);
    });
  });
}

    // contains all valid fields - will get parsed
    // '{"time":"2024-03-26T04:30","interval":900,"temperature_2m":54.3,"relative_humidity_2m":45,"apparent_temperature":46.5,"is_day":1,"weather_code":1, "precipitation_probability":33':
    // WeatherNow(condition: WeatherCondition.clearSky, temperature: 54.3, relativeHumidity: 45, isDaytime: true, precipitationChance: 33, time: "2024-03-26T04:30")
    // '{"id": 0, "first_name": "Chahat", "last_name": "Gupta"}':
    //     User(id: 0, firstName: 'Chahat', lastName: 'Gupta'),


    // invalid JSON string - will not be parsed
    // '{"id": 0, "first_name": "Chahat", "last_name": Gupta}':
    //     throwsA(isA<FormatException>())
//   };

//   inputs.forEach((String input, dynamic expected) {
//     test(input,() => expect(
// expected is WeatherNow
//                 ? WeatherNow.fromJson(jsonDecode(input))
//                 : () => WeatherNow.fromJson(jsonDecode(input)),
//             expected));