import 'forecast_entity.dart';

class WeatherEntity {
  final String city;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final String condition;
  final DateTime selectedDate;
  final double maxtempC;
  final List<ForecastEntity> forecast;
  final String description;

  WeatherEntity({
    required this.city,
    required this.humidity,
    required this.windSpeed,
    required this.temperature,
    required this.condition,
    required this.selectedDate,
    required this.forecast,
    required this.maxtempC,
    required this.description,
  });

  /// **تحويل `WeatherModel` إلى `WeatherEntity` باستخدام `fromJson`**
  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      city: json['location']?['name'] ?? 'Unknown',
      temperature: (json['current']?['temp_c'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['current']?['humidity'] as num?)?.toDouble() ?? 0.0,
      windSpeed: (json['current']?['wind_kph'] as num?)?.toDouble() ?? 0.0,
      maxtempC: (json['forecast']?['forecastday']?[0]?['day']?['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
      condition: json['current']?['condition']?['text'] ?? 'Unknown',
      description: json['current']?['condition']?['text'] ?? 'Unknown', // ✅ تمرير وصف الطقس
      selectedDate: (json['forecast']?['forecastday'] != null && (json['forecast']['forecastday'] as List).isNotEmpty)
          ? DateTime.parse(json['forecast']['forecastday'][0]['date'])
          : DateTime.now(),
      forecast: (json['forecast']?['forecastday'] as List?)
          ?.map((e) => ForecastEntity.fromJson(e))
          .toList() ??
          [],
    );
  }


  List<int> toTennisModelInput() {
    int outlookIsRainy = (description?.toLowerCase() ?? '').contains('rain') ? 1 : 0;
    int outlookIsSunny = (description?.toLowerCase() ?? '').contains('sunny') ? 1 : 0;
    int temperatureIsHot = temperature > 25.0 ? 1 : 0;
    int temperatureIsMild = (temperature >= 15.0 && temperature <= 25.0) ? 1 : 0;
    int humidityIsNormal = humidity.toInt() <= 60 ? 1 : 0;

    return [
      outlookIsRainy,
      outlookIsSunny,
      temperatureIsHot,
      temperatureIsMild,
      humidityIsNormal,
    ];
  }

}



