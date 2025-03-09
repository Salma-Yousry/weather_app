class ForecastEntity {
  final String date;
  final DayEntity day;
  final double? maxTemp;
  final double? minTemp;

  ForecastEntity({
    required this.date,
    required this.day,
    this.maxTemp,
    this.minTemp,
  });


  factory ForecastEntity.fromJson(Map<String, dynamic> json) {
    return ForecastEntity(
      date: json['date'],
      day: DayEntity.fromJson(json['day'] ?? {}),
      maxTemp: (json['day']?['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (json['day']?['mintemp_c'] ?? 0.0).toDouble(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day,
      'maxtemp_c': maxTemp,
      'mintemp_c': minTemp,
    };
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
      avgtempC: (json['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
      avghumidity: (json['avghumidity'] as num?)?.toInt() ?? 0,
      dailyChanceOfRain: (json['daily_chance_of_rain'] as num?)?.toInt() ?? 0,
      maxWindKph: (json['maxwind_kph'] as num?)?.toDouble() ?? 0.0,
      maxtempC: (json['maxtemp_c'] ?? 0.0).toDouble(),
    );
  }
}