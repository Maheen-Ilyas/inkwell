import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/failure.dart';
import 'package:inkwell/core/usecase/usecase.dart';
import 'package:inkwell/feature/auth/domain/repository/auth_repository.dart';

class UserSignIn implements UseCase<String, SignInParams> {
  final AuthRepository repository;
  UserSignIn(this.repository);
  @override
  Future<Either<Failure, String>> call(SignInParams params) async {
    return await repository.signInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;
  SignInParams({
    required this.email,
    required this.password,
  });
}
