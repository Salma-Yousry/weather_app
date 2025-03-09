import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import '../cubit/weather_cubit/weather_cubit.dart';
import '../cubit/weather_cubit/weather_state.dart';

class GetPredictionBlocListener extends StatelessWidget {
  const GetPredictionBlocListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is TennisPredictionSuccessState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: ColorManager.grey1,
                contentPadding: EdgeInsets.all(24.h),
                content: Text(
                  state.prediction == 1
                      ? AppStrings.youCanPlay
                      : AppStrings.youCanPlay,
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppStrings.ok,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is TennisPredictionErrorState) {
          print('${AppStrings.errorPrediction} ${state.message}');
        }
      },
      child: Center(
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          color: ColorManager.appBarTitleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          onPressed: () {
    BlocProvider.of<WeatherCubit>(context).getTennisPredictionData(

        );
          },
          child: Text(
            AppStrings.GetPredictions,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}