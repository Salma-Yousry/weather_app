import 'package:injectable/injectable.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasource/remote_data_source.dart';
import '../../domain/entities/weather_entity.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<WeatherEntity> getWeather(String city, DateTime selectedDate) async {
    return await remoteDataSource.fetchWeather(city, selectedDate);
  }
}

