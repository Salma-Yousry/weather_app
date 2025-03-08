import '../../domain/entities/weather_entity.dart';
import 'forecast_model.dart';

class WeatherModel {
  final String city;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final String condition;
  final DateTime selectedDate;
  final double maxtempC;
  final List<ForecastModel> forecast;

  WeatherModel({
    required this.city,
    required this.humidity,
    required this.windSpeed,
    required this.temperature,
    required this.condition,
    required this.selectedDate,
    required this.forecast,
    required this.maxtempC
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      city: map['location']?['name'] ?? 'Unknown',
      temperature: (map['current']?['temp_c'] as num?)?.toDouble() ?? 0.0,
      humidity: (map['current']?['humidity'] as num?)?.toDouble() ?? 0.0,
      windSpeed: (map['current']?['wind_kph'] as num?)?.toDouble() ?? 0.0,
      maxtempC: (map['current']?['maxtemp_C'] as num?)?.toDouble() ?? 0.0,
      condition: map['current']?['condition']?['text'] ?? 'Unknown',
      selectedDate: (map['forecast']?['forecastday'] != null && (map['forecast']['forecastday'] as List).isNotEmpty)
          ? DateTime.parse(map['forecast']['forecastday'][0]['date'])
          : DateTime.now(),
      forecast: (map['forecast']?['forecastday'] as List?)?.map((e) => ForecastModel.fromJson(e)).toList() ?? [],
    );
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      city: city,
      temperature: temperature,
      humidity: humidity,
      windSpeed: windSpeed,
      condition: condition,
      selectedDate: selectedDate,
        maxtempC: maxtempC,
      forecast: forecast.map((e) => e.toEntity()).toList(),
    );
  }
}



