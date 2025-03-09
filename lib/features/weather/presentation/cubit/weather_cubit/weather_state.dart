
import '../../../domain/entities/weather_entity.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class SetIndexState extends WeatherState {
  final int selectedIndex;
  SetIndexState({required this.selectedIndex});
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;
  final String selectedCity;
  WeatherLoaded(this.weather, this.selectedCity);

}

class WeatherError extends WeatherState {
  final String message;
  WeatherError({required this.message});
}

class TennisPredictionLoadingState extends WeatherState {}

class TennisPredictionSuccessState extends WeatherState {
  final int prediction;
  TennisPredictionSuccessState({required this.prediction});
}

class TennisPredictionErrorState extends WeatherState {
  final String message;
  TennisPredictionErrorState({required this.message});
}

