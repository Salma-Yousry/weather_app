part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;
  final String selectedCity;

  WeatherLoaded(this.weather, this.selectedCity);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
