import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/failure.dart';
import 'package:inkwell/core/usecase/usecase.dart';
import 'package:inkwell/feature/auth/domain/entities/profile.dart';
import 'package:inkwell/feature/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<Profile, UserSignUpParams> {
  final AuthRepository repository;
  UserSignUp(this.repository);
  @override
  Future<Either<Failure, Profile>> call(UserSignUpParams params) async {
    return await repository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;
  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
