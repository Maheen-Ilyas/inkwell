import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/exceptions.dart';
import 'package:inkwell/core/error/failure.dart';
import 'package:inkwell/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inkwell/feature/auth/domain/entities/profile.dart';
import 'package:inkwell/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, Profile>> appleSignIn() {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> appleSignUp() {
    // TODO: implement appleSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> facebookSignUp() {
    // TODO: implement facebookSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> googleSignUp() {
    // TODO: implement googleSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (_) {
      return left(Failure(_.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (_) {
      return left(Failure(_.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> twitterSignIn() {
    // TODO: implement twitterSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> twitterSignUp() {
    // TODO: implement twitterSignUp
    throw UnimplementedError();
  }
}
