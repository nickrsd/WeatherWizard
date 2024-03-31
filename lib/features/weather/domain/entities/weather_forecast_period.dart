/// across what period does this weather report data for, just right now (currentWeather), across multiple days, or an hourly forecast.
enum DailyForecastPeriod { one, three, seven, ten, fourteen }

enum HourlyForecastPeriod { six, nine, twelve, twentyfour, fourtyeight }

extension DailyForecastNumeric on DailyForecastPeriod {
  int get days => switch (this) {
        DailyForecastPeriod.one => 1,
        DailyForecastPeriod.three => 3,
        DailyForecastPeriod.seven => 7,
        DailyForecastPeriod.ten => 10,
        DailyForecastPeriod.fourteen => 14,
      };
}

extension HourlyForecastNumeric on HourlyForecastPeriod {
  int get hours => switch (this) {
        HourlyForecastPeriod.six => 6,
        HourlyForecastPeriod.nine => 9,
        HourlyForecastPeriod.twelve => 12,
        HourlyForecastPeriod.twentyfour => 24,
        HourlyForecastPeriod.fourtyeight => 48,
      };
}
