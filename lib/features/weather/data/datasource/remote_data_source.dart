import 'package:injectable/injectable.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/network/network_service.dart';
import '../../domain/entities/weather_entity.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> fetchWeather(String city, DateTime selectedDate);
  Future<int> predictTennisPlay(WeatherEntity weather);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceWeatherImpl implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceWeatherImpl(this.networkService);

  @override
  Future<WeatherEntity> fetchWeather(String city, DateTime selectedDate) async {
    final url = Uri.parse(
        "${AppConstants.baseUrl}?key=${AppConstants.apiKey}&q=$city&days=5"
    );

    print("Fetching weather from: $url");

    final jsonData = await networkService.fetchData(url);
    return WeatherEntity.fromJson(jsonData);
  }

  List<WeatherEntity> parseWeatherData(Map<String, dynamic> data) {
    List<WeatherEntity> weatherList = [];
    for (var item in data['forecast']['forecastday']) {
      weatherList.add(WeatherEntity.fromJson(item));
    }
    return weatherList;
  }

  @override
  Future<int> predictTennisPlay(WeatherEntity weather) async {
    var features = weather.toTennisModelInput();
    var prediction = await networkService.post(features);
    return prediction;
  }
}

