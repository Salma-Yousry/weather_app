import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../cubit/weather_cubit/weather_cubit.dart';
import 'Weather_Details.dart';

class WeatherDisplay extends StatelessWidget {
  final DateTime selectedDay;

  WeatherDisplay({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        } else if (state is WeatherLoaded) {
          final selectedDayWeather = state.weather.forecast?.firstWhere(
                (day) => DateTime.parse(day.date!).day == selectedDay.day,
            orElse: () => state.weather.forecast!.first,
          );

          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "${selectedDayWeather?.day?.avgtempC ?? '--'}°C",
                  style:getBoldStyle(fontSize: 50.sp, color: ColorManager.white),
                ),

                SizedBox(height: 20.h),
                WeatherDetails(
                  humidity: selectedDayWeather?.day?.avghumidity?.toString() ?? "--",
                  windSpeed: selectedDayWeather?.day?.maxWindKph?.toString() ?? "--",
                ),
              ],
            ),
          );
        } else if (state is WeatherError) {
          return Center(child: Text(state.message, style: getBoldStyle(fontSize: 24, color: ColorManager.error)));
        }
        return Container();
      },
    );
  }
}


