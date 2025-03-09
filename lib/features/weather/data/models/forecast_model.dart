import '../../domain/entities/Forecast_Entity.dart';

class ForecastModel {
  final String date;
  final DayModel day;
  final double? maxTemp;
  final double? minTemp;

  ForecastModel({
    required this.date,
    required this.day,
    this.maxTemp,
    this.minTemp,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'] ?? '',
      day: DayModel.fromJson(json['day'] ?? {}),
      maxTemp: (json['day']?['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (json['day']?['mintemp_c'] ?? 0.0).toDouble(),
    );
  }

  ForecastEntity toEntity() {
    return ForecastEntity(
      date: date,
      day: day.toEntity(),
      maxTemp: maxTemp,
      minTemp: minTemp,
    );
  }
}



class DayModel {
  final double avgtempC;
  final int avghumidity;
  final int dailyChanceOfRain;
  final double maxWindKph;
  final double maxtempC;

  DayModel({
    required this.avgtempC,
    required this.avghumidity,
    required this.dailyChanceOfRain,
    required this.maxWindKph,
    required this.maxtempC
  });

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      avgtempC: (json['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
      avghumidity: (json['avghumidity'] as num?)?.toInt() ?? 0,
      maxtempC: (json['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
      dailyChanceOfRain: (json['daily_chance_of_rain'] as num?)?.toInt() ?? 0,
      maxWindKph: (json['maxwind_kph'] as num?)?.toDouble() ?? 0.0,
    );
  }

  DayEntity toEntity() {
    return DayEntity(
      avgtempC: avgtempC,
      avghumidity: avghumidity,
      dailyChanceOfRain: dailyChanceOfRain,
      maxWindKph: maxWindKph,
        maxtempC:maxtempC
    );
  }
}