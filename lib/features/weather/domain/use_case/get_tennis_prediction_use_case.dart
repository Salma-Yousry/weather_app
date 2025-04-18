
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/dio_errors.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

@injectable
class GetTennisPredictionUseCase {
  final WeatherRepository weatherRepository;

  GetTennisPredictionUseCase(this.weatherRepository);

  Future<Either<Failure, int>> call(WeatherEntity weather) async {
    try {
      final prediction = await weatherRepository.predictTennisPlay(weather);
      return Right(prediction);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
