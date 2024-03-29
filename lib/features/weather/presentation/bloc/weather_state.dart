sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherUpdated extends WeatherState {}

class WeatherFailure extends WeatherState {}
