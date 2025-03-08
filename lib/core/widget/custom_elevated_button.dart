import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/styles_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.radius,
    this.textStyle,
    this.isStadiumBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: isStadiumBorder
            ? const StadiumBorder()
            : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
        ),
        backgroundColor: backgroundColor ?? ColorManager.primary,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          SizedBox(width:10.w),
          Text(
            label,
            style: textStyle ??
                getMediumStyle(color: ColorManager.white).copyWith(fontSize: 20.sp),
          ),
          SizedBox(width: 10.w),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}