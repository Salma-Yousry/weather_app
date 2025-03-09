import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity>getWeather(String city, DateTime selectedDate);
  Future<int> predictTennisPlay(WeatherEntity weather);
}
