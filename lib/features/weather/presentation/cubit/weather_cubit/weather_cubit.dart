import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/weather/presentation/cubit/weather_cubit/weather_state.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/repositories/weather_repository.dart';
import '../../../domain/use_case/get_tennis_prediction_use_case.dart';
import '../../../domain/use_case/get_weather_usecase.dart';


@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetTennisPredictionUseCase getTennisPredictionUseCase;
  List<WeatherEntity> weatherList = [];
  int selectedIndex = 0;
  String selectedCity = "Cairo";

  WeatherCubit(
      this.getWeatherUseCase,
      this.getTennisPredictionUseCase,
      ) : super(WeatherInitial());

  Future<void> fetchWeather(String city, DateTime date) async {
    try {
      emit(WeatherLoading());

      final weather = await getWeatherUseCase(city, date);
      selectedCity = city;

      emit(WeatherLoaded(weather, selectedCity));
    } catch (e) {
      emit(WeatherError(message: "Network Error: $e"));
    }
  }


  Future<void> getTennisPredictionData() async {
    if (weatherList.isEmpty || selectedIndex >= weatherList.length) return;

    emit(TennisPredictionLoadingState());

    final result = await getTennisPredictionUseCase(weatherList[selectedIndex]);

    result.fold(
          (failure) => emit(TennisPredictionErrorState(message: failure.toString())),
          (prediction) => emit(TennisPredictionSuccessState(prediction: prediction)),
    );
  }


  void setSelectedIndex(int index) {
    if (index >= 0 && index < weatherList.length) {
      selectedIndex = index;
      emit(SetIndexState(selectedIndex: index));
    }
  }
}

