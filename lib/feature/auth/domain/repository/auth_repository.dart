import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/failure.dart';

abstract interface class AuthRepository {
  // Abstract classes provide base class for concrete sub-classes for inheritance
  // Abstract interfaces provide methods that every class must implement
  // Either allows us to define if the return type is success or failure

  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> googleSignUp();

  Future<Either<Failure, String>> googleSignIn();

  Future<Either<Failure, String>> facebookSignUp();

  Future<Either<Failure, String>> facebookSignIn();

  Future<Either<Failure, String>> appleSignUp();

  Future<Either<Failure, String>> appleSignIn();

  Future<Either<Failure, String>> twitterSignUp();

  Future<Either<Failure, String>> twitterSignIn();
}
