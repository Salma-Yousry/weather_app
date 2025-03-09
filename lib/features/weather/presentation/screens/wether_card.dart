import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import 'weather_display.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherCard extends StatelessWidget {
  final DateTime selectedDay;

  WeatherCard({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: ColorManager.darkBlue, blurRadius: 10.r , spreadRadius: 1, offset: Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.r, sigmaY: 10.r),
          child: Padding(
            padding:  EdgeInsets.all(16.0.h),
            child: WeatherDisplay(selectedDay: selectedDay),
          ),
        ),
      ),
    );
  }
}
