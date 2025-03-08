import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/network/network_service.dart';
import '../../domain/entities/weather_entity.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> fetchWeather(String city, DateTime selectedDate);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceWeatherImpl implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceWeatherImpl(this.networkService);

  @override
  Future<WeatherEntity> fetchWeather(String city, DateTime selectedDate) async {
    final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?"
            "key=${AppConstants.apiKey}&q=$city&days=5"
    );

    print("Fetching weather from: $url");

    final jsonData = await networkService.fetchData(url);
    return WeatherEntity.fromJson(jsonData);
  }
}
