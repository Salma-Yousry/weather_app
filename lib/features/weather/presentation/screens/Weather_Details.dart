import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/styles_manager.dart';

class WeatherDetails extends StatelessWidget {
  final String humidity;
  final String windSpeed;

  WeatherDetails({required this.humidity, required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDetail(icon: Icons.water_drop, value: "$humidity%", label: "Humidity"),
        _buildDetail(icon: Icons.air, value: "$windSpeed km/h", label: "Wind Speed"),
      ],
    );
  }

  Widget _buildDetail({required IconData icon, required String value, required String label}) {
    return Column(
      children: [
        Icon(icon, color: ColorManager.white, size: 30.sp),
        SizedBox(height: 5.h),
        Text(value, style:  getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
        Text(label, style:  getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
      ],
    );
  }
}
