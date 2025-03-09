import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/auth/presentation/cubit/signup_cubit/signup_state.dart';

import '../../../domain/use_case/signup_usecase.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  void signup(String email, String password) async {
    emit(SignupLoading());
    try {
      await signupUseCase.execute(email, password);
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}