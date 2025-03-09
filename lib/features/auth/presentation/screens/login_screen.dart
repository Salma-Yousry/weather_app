import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/widget/Custom_Text_Form_Field.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/dialog_until.dart';
import '../../../../core/widget/validators.dart';
import '../../../weather/presentation/screens/weather_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'salma@gmail.com');
  final passwordController = TextEditingController(text:'salma123');

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
                    AppStrings.loginBtnText,
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(height: 8.w),
                  CustomTextFormField(
                    label: AppStrings.emailText,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.validateEmail,
                  ),
                  SizedBox(height: 10.w),
                  CustomTextFormField(
                    label: AppStrings.passwordText,
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    validator: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 10.w),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        DialogUtils.showLoading(context: context, message: 'Waiting...');

                      } else if (state is LoginSuccess) {
                        DialogUtils.hideLoading(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherScreen(fullName: '',)),
                        );

                      } else if (state is LoginFailure) {
                        DialogUtils.hideLoading(context);
                        DialogUtils.showMessage(
                          context: context,
                          posActionName: AppStrings.ok,
                          message: state.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        label: AppStrings.loginBtnText,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.signUp);
                    },
                    child: Text(
                      AppStrings.noAccountText,
                      style: getMediumStyle(
                        fontSize: FontSize.s20,
                        color: ColorManager.blue,
                      ),
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
