import 'package:fpdart/fpdart.dart';
import 'package:inkwell/core/error/failure.dart';
import 'package:inkwell/feature/auth/domain/entities/profile.dart';

abstract interface class AuthRepository {
  // Abstract classes provide base class for concrete sub-classes for inheritance
  // Abstract interfaces provide methods that every class must implement
  // Either allows us to define if the return type is success or failure

  Future<Either<Failure, Profile>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Profile>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Profile>> googleSignUp();

  Future<Either<Failure, Profile>> googleSignIn();

  Future<Either<Failure, Profile>> facebookSignUp();

  Future<Either<Failure, Profile>> facebookSignIn();

  Future<Either<Failure, Profile>> appleSignUp();

  Future<Either<Failure, Profile>> appleSignIn();

  Future<Either<Failure, Profile>> twitterSignUp();

  Future<Either<Failure, Profile>> twitterSignIn();
}
