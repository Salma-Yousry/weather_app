// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/datasources/remote_data_source.dart' as _i4;
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i9;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i8;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i11;
import '../../features/auth/domain/use_case/signup_usecase.dart' as _i12;
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i14;
import '../../features/auth/presentation/cubit/signup_cubit/signup_cubit.dart'
    as _i15;
import '../../features/weather/data/datasource/remote_data_source.dart' as _i5;
import '../../features/weather/data/repositories/weather_repository_impl.dart'
    as _i7;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i6;
import '../../features/weather/domain/use_case/get_weather_usecase.dart'
    as _i10;
import '../../features/weather/presentation/cubit/weather_cubit/weather_cubit.dart'
    as _i13;
import '../network/network_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.NetworkService>(() => _i3.NetworkService());
    gh.lazySingleton<_i4.RemoteDataSource>(() => _i4.RemoteDataSource());
    gh.lazySingleton<_i5.RemoteDataSource>(
        () => _i5.RemoteDataSourceWeatherImpl(gh<_i3.NetworkService>()));
    gh.lazySingleton<_i6.WeatherRepository>(
        () => _i7.WeatherRepositoryImpl(gh<_i5.RemoteDataSource>()));
    gh.lazySingleton<_i8.AuthRepository>(() =>
        _i9.AuthRepositoryImpl(remoteDataSource: gh<_i4.RemoteDataSource>()));
    gh.factory<_i10.GetWeatherUseCase>(
        () => _i10.GetWeatherUseCase(gh<_i6.WeatherRepository>()));
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(authRepository: gh<_i8.AuthRepository>()));
    gh.factory<_i12.SignupUseCase>(
        () => _i12.SignupUseCase(authRepository: gh<_i8.AuthRepository>()));
    gh.factory<_i13.WeatherCubit>(
        () => _i13.WeatherCubit(gh<_i10.GetWeatherUseCase>()));
    gh.factory<_i14.LoginCubit>(
        () => _i14.LoginCubit(loginUseCase: gh<_i11.LoginUseCase>()));
    gh.factory<_i15.SignupCubit>(
        () => _i15.SignupCubit(signupUseCase: gh<_i12.SignupUseCase>()));
    return this;
  }
}
