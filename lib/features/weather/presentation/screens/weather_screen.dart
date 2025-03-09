import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../domain/use_case/get_tennis_prediction_use_case.dart';
import '../../domain/use_case/get_weather_usecase.dart';
import 'weather_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/weather_cubit/weather_cubit.dart';

class WeatherScreen extends StatelessWidget {
  final String fullName;
  WeatherScreen({required this.fullName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(getIt<GetWeatherUseCase>(), getIt<GetTennisPredictionUseCase>(),getIt<WeatherRepository>())..fetchWeather("Cairo", DateTime.now()),
      child: Scaffold(
        backgroundColor: ColorManager.darkBlue,
        appBar: AppBar(
          title: Text("${AppStrings.welcome} $fullName",style: getBoldStyle(fontSize: 24.sp, color: ColorManager.white)),
          backgroundColor: ColorManager.darkBlue,
          centerTitle: true,
        ),

        body: WeatherScreenBody(fullName: fullName),
      ),
    );
  }
}




