import 'package:injectable/injectable.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

@injectable
class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherEntity> call(String city, DateTime date) async {
    return await repository.getWeather(city, date);
  }
}
