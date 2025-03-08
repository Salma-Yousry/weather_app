import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';
@injectable
class SignupUseCase {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  Future<UserEntity> execute(String email, String password) async {

    return await authRepository.signup(email, password);
  }
}