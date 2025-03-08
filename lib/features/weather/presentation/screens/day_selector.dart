import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/color_manager.dart';

import '../../../../core/utils/styles_manager.dart';

class DaySelector extends StatelessWidget {
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;

  DaySelector({required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          DateTime day = DateTime.now().add(Duration(days: index));
          return GestureDetector(
            onTap: () => onDaySelected(day),
            child: Container(
              padding: EdgeInsets.all(30.h),
              margin: EdgeInsets.symmetric(horizontal: 7.h),
              decoration: BoxDecoration(
                color: selectedDay.day == day.day ? ColorManager.blue : ColorManager.grey2,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat('E').format(day), style:  getBoldStyle(fontSize: 15.sp, color: ColorManager.white)),
                  Text(DateFormat('d').format(day), style:getBoldStyle(fontSize: 13.sp, color: ColorManager.white)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
