import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/widget/Custom_Text_Form_Field.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/dialog_until.dart';
import '../../../../core/widget/validators.dart';
import '../../../weather/presentation/screens/weather_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/signup_cubit/signup_cubit.dart';
import '../cubit/signup_cubit/signup_state.dart';


class SignupScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.signUpBtnText,
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(height: 8.w),
                  CustomTextFormField(
                    label: AppStrings.nameText,
                    controller: nameController,
                    validator: (text) => text == null || text.trim().isEmpty ? 'Please enter your full name.' : null,
                  ),
                  CustomTextFormField(
                    label: AppStrings.emailText,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.validateEmail,
                  ),
                  CustomTextFormField(
                    label: AppStrings.passwordText,
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 10.w),
                  BlocConsumer<SignupCubit,SignupState>(
                    listener: (context, state) {
                      if (state is SignupLoading) {
                        DialogUtils.showLoading(context: context, message: 'Creating Account...');
                      } else if (state is SignupSuccess) {
                        DialogUtils.hideLoading(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherScreen(fullName: nameController.text,)),
                        );

                      } else if (state is SignupFailure) {
                        DialogUtils.hideLoading(context);
                        DialogUtils.showMessage(context: context, message: state.error, posActionName: 'OK');
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        label: AppStrings.signUpBtnText,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignupCubit>().signup(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10.w),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppStrings.haveAccountText,
                      style: getMediumStyle(fontSize: FontSize.s20, color: ColorManager.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
