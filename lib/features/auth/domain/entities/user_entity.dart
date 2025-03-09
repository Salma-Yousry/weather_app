import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uid;
  final String email;

  UserEntity({
    required this.uid,
    required this.email,
  });

  factory UserEntity.fromUser(User user) {
    return UserEntity(
      uid: user.uid,
      email: user.email ?? '',
    );
  }
}