import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/exceptions.dart';
import 'package:inkwell/core/error/failure.dart';
import 'package:inkwell/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inkwell/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> appleSignIn() {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> appleSignUp() {
    // TODO: implement appleSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> facebookSignUp() {
    // TODO: implement facebookSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> googleSignUp() {
    // TODO: implement googleSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(userID);
    } on ServerException catch (_) {
      return left(Failure(_.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userID);
    } on ServerException catch (_) {
      return left(Failure(_.message));
    }
  }

  @override
  Future<Either<Failure, String>> twitterSignIn() {
    // TODO: implement twitterSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> twitterSignUp() {
    // TODO: implement twitterSignUp
    throw UnimplementedError();
  }
}
