import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_search_dialog.dart';
import 'package:weather_app/features/weather/presentation/screens/wether_card.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../cubit/weather_cubit/weather_cubit.dart';
import 'day_selector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WeatherScreenBody extends StatefulWidget {
  final String fullName;
  WeatherScreenBody({required this.fullName});

  @override
  _WeatherScreenBodyState createState() => _WeatherScreenBodyState();
}

class _WeatherScreenBodyState extends State<WeatherScreenBody> {
  DateTime selectedDay = DateTime.now();
  String city = AppConstants.city;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<WeatherCubit>().fetchWeather(city, selectedDay));
  }

  void _updateCity(String newCity) {
    setState(() {
      city = newCity;
    });
    context.read<WeatherCubit>().fetchWeather(city, selectedDay);
  }

  void _updateDay(DateTime newDay) {
    setState(() {
      selectedDay = newDay;
    });
    context.read<WeatherCubit>().fetchWeather(city, selectedDay);
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => WeatherSearchDialog(onCitySelected: _updateCity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorManager.darkBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: _showSearchDialog,
        backgroundColor:  ColorManager.transparent,
        child: Icon(Icons.search, color: ColorManager.white,),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.h, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  String cityName =  AppConstants.city;
                  if (state is WeatherLoaded) {
                    cityName = state.selectedCity;
                  }
                  return _buildWelcomeCard(cityName);
                },
              ),
              SizedBox(height: 30.h),
              DaySelector(selectedDay: selectedDay, onDaySelected: _updateDay),
              SizedBox(height: 20.h),
              Expanded(child: WeatherCard(selectedDay: selectedDay)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(String cityName) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.r,
            spreadRadius: 2.r,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: ColorManager.white, size: 20.h),
          SizedBox(width: 5.h),
          Text(
            "Checking weather in $cityName ",
            style: getBoldStyle(fontSize: 20.h, color: ColorManager.white)
          ),
        ],
      ),
    );
  }
}
