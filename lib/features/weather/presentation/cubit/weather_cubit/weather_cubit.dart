import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/weather_entity.dart';
import '../../../domain/use_case/get_weather_usecase.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  String selectedCity = "Cairo"; // ✅ المدينة الافتراضية

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  Future<void> fetchWeather(String city, DateTime date) async {
    try {
      emit(WeatherLoading());

      final weather = await getWeatherUseCase(city, date);
      selectedCity = city; // ✅ تحديث اسم المدينة المختارة

      emit(WeatherLoaded(weather, selectedCity));
    } catch (e) {
      emit(WeatherError("Network Error: $e"));
    }
  }
}



