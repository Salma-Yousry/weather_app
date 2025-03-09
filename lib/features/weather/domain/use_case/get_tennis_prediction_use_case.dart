
import 'package:injectable/injectable.dart';

import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

@injectable
class GetTennisPredictionUseCase {
  final WeatherRepository weatherRepository;

  GetTennisPredictionUseCase(this.weatherRepository);

  Future<int> call(WeatherEntity weather) async =>
      await weatherRepository.predictTennisPlay(weather);


}
