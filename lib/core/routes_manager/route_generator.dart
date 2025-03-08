
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/routes_manager/routes.dart';
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/auth/presentation/screens/startScreenAuth.dart';
import '../../features/weather/presentation/cubit/weather_cubit/weather_cubit.dart';
import '../../features/weather/presentation/screens/weather_screen.dart';
import '../di/di.dart';

class RouteGenerator{


  static Route <dynamic> getRoute(RouteSettings settings){
switch (settings.name) {

  case Routes.startScreenAuth:
    return MaterialPageRoute(builder: (_) => StartScreenAuth());
  case Routes.logIn:
    return MaterialPageRoute(builder:(_) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: LoginScreen(),
    ));
  case Routes.signUp:
    return MaterialPageRoute(builder: (_) => BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: SignupScreen(),
    ),);
  case Routes.weatherScreen:
    final String fullName = settings.arguments as String;
    return MaterialPageRoute(

      builder: (context) => BlocProvider<WeatherCubit>(
        create: (context) => getIt <WeatherCubit>(),
        child: WeatherScreen(fullName: fullName,),
      ),
    );
  default:
    return unDefinedRoute();
}

}

static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(
      builder: (_)=>Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found'),),
      )
    );
}
}