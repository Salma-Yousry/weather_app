import 'package:flutter/material.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';


class StartScreenAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              label: AppStrings.signUpBtnText,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.signUp);
              },
              backgroundColor: ColorManager.blue,
              textStyle: getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s24,
              ),
            ),
            SizedBox(height: AppSize.s20),
            CustomElevatedButton(
              label: AppStrings.loginBtnText,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.logIn);
              },
              backgroundColor: ColorManager.white,
              textStyle: getBoldStyle(
                color: ColorManager.blue,
                fontSize: FontSize.s24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}