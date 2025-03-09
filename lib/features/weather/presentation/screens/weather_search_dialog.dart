import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weather_app/core/utils/app_strings.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class WeatherSearchDialog extends StatefulWidget {
  final Function(String) onCitySelected;

  WeatherSearchDialog({required this.onCitySelected});

  @override
  _WeatherSearchDialogState createState() => _WeatherSearchDialogState();
}

class _WeatherSearchDialogState extends State<WeatherSearchDialog> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: ColorManager.darkBlue,
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.Searchcity,
              style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkBlue),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: AppStrings.cityDialgoueText,
                prefixIcon: Icon(LucideIcons.search, color: ColorManager.darkBlue),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  onTap: () => Navigator.pop(context),
                  label: AppStrings.cancel,

                ),
                CustomElevatedButton(
                  onTap: () {
                    if (_cityController.text.isNotEmpty) {
                      widget.onCitySelected(_cityController.text);
                      Navigator.pop(context);
                    }
                  },
                  label: AppStrings.search,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
