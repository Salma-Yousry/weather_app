import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/utils/constants_manager.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasource/remote_data_source.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<WeatherEntity> getWeather(String city, DateTime selectedDate) async {
    return remoteDataSource.fetchWeather(city, selectedDate);
  }

  @override
  Future<int> predictTennisPlay(WeatherEntity weather) async {
    try {


      final response = await http.post(
        Uri.parse(AppConstants.aiModelBaseURL),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(weather),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        if (result is int) {
          return result;
        } else {
          throw Exception('Invalid response format, expected int');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to predict tennis play: ${e.toString()}');
    }
  }
}

