
import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
@injectable
class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<UserEntity> execute(String email, String password) async {
    return await authRepository.login(email, password);
  }
}