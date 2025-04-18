// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/remote_data_source.dart' as _i98;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/signup_usecase.dart' as _i305;
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i153;
import '../../features/auth/presentation/cubit/signup_cubit/signup_cubit.dart'
    as _i174;
import '../../features/weather/data/datasource/remote_data_source.dart'
    as _i867;
import '../../features/weather/data/repositories/weather_repository_impl.dart'
    as _i231;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i956;
import '../../features/weather/domain/use_case/get_tennis_prediction_use_case.dart'
    as _i642;
import '../../features/weather/domain/use_case/get_weather_usecase.dart'
    as _i494;
import '../../features/weather/presentation/cubit/weather_cubit/weather_cubit.dart'
    as _i566;
import '../network/network_service.dart' as _i1025;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i1025.NetworkService>(() => _i1025.NetworkService());
    gh.lazySingleton<_i98.RemoteDataSource>(() => _i98.RemoteDataSource());
    gh.lazySingleton<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
        remoteDataSource: gh<_i98.RemoteDataSource>()));
    gh.lazySingleton<_i867.RemoteDataSource>(
        () => _i867.RemoteDataSourceWeatherImpl(gh<_i1025.NetworkService>()));
    gh.factory<_i973.LoginUseCase>(
        () => _i973.LoginUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.factory<_i305.SignupUseCase>(
        () => _i305.SignupUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.lazySingleton<_i956.WeatherRepository>(
        () => _i231.WeatherRepositoryImpl(gh<_i867.RemoteDataSource>()));
    gh.factory<_i153.LoginCubit>(
        () => _i153.LoginCubit(loginUseCase: gh<_i973.LoginUseCase>()));
    gh.factory<_i494.GetWeatherUseCase>(
        () => _i494.GetWeatherUseCase(gh<_i956.WeatherRepository>()));
    gh.factory<_i642.GetTennisPredictionUseCase>(
        () => _i642.GetTennisPredictionUseCase(gh<_i956.WeatherRepository>()));
    gh.factory<_i174.SignupCubit>(
        () => _i174.SignupCubit(signupUseCase: gh<_i305.SignupUseCase>()));
    gh.factory<_i566.WeatherCubit>(() => _i566.WeatherCubit(
          gh<_i494.GetWeatherUseCase>(),
          gh<_i642.GetTennisPredictionUseCase>(),
        ));
    return this;
  }
}
