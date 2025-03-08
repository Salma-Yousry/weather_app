class WeatherEntity {
  final String city;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final String condition;
  final DateTime selectedDate;
  final double maxtempC;
  final List<ForecastEntity> forecast;

  WeatherEntity({
    required this.city,
    required this.windSpeed,
    required this.humidity,
    required this.temperature,
    required this.condition,
    required this.selectedDate,
    required this.forecast,
    required this.maxtempC
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      city: json['location']?['name'] ?? 'Unknown',
      temperature: (json['current']?['temp_c'] ?? 0.0).toDouble(),
      humidity: (json['current']?['humidity'] ?? 0.0).toDouble(),
      windSpeed: (json['current']?['wind_kph'] ?? 0.0).toDouble(),
      condition: json['current']?['condition']?['text'] ?? 'Unknown',
      maxtempC: (json['current']?['maxtemp_C'] ?? 0.0).toDouble(),
      selectedDate: DateTime.now(),
      forecast: (json['forecast']?['forecastday'] as List<dynamic>?)?.map((day) => ForecastEntity.fromJson(day)).toList() ?? [],
    );
  }
}

class ForecastEntity {
  final String date;
  final DayEntity day;

  ForecastEntity({required this.date, required this.day});

  factory ForecastEntity.fromJson(Map<String, dynamic> json) {
    return ForecastEntity(
      date: json['date'] ?? '',
      day: DayEntity.fromJson(json['day'] ?? {}),
    );
  }
}

class DayEntity {
  final double avgtempC;
  final int avghumidity;
  final int dailyChanceOfRain;
  final double maxWindKph;
  final double maxtempC;

  DayEntity({
    required this.avgtempC,
    required this.avghumidity,
    required this.dailyChanceOfRain,
    required this.maxWindKph,
    required this.maxtempC
  });

  factory DayEntity.fromJson(Map<String, dynamic> json) {
    return DayEntity(
      avgtempC: (json['avgtemp_c'] ?? 0.0).toDouble(),
      avghumidity: json['avghumidity'] ?? 0,
      maxtempC: json['maxtemp_C'] ?? 0,
      dailyChanceOfRain: json['daily_chance_of_rain'] ?? 0,
      maxWindKph: (json['maxwind_kph'] ?? 0.0).toDouble(),
    );
  }
}

