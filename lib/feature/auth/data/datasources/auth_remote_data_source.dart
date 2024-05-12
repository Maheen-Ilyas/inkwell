import 'package:inkwell/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<String> googleSignUp();

  Future<String> googleSignIn();

  Future<String> facebookSignUp();

  Future<String> facebookSignIn();

  Future<String> appleSignUp();

  Future<String> appleSignIn();

  Future<String> twitterSignUp();

  Future<String> twitterSignIn();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  // This is called as Dependency Injection. When the class is initialized, the database is passed to the constructor
  // This is done to avoid dependency creation between the class and the database and for testing
  final SupabaseClient client;
  AuthRemoteDataSourceImplementation(this.client);

  @override
  Future<String> appleSignIn() {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<String> appleSignUp() {
    // TODO: implement appleSignUp
    throw UnimplementedError();
  }

  @override
  Future<String> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<String> facebookSignUp() {
    // TODO: implement facebookSignUp
    throw UnimplementedError();
  }

  @override
  Future<String> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<String> googleSignUp() {
    // TODO: implement googleSignUp
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!.id;
    } catch (_) {
      throw ServerException(_.toString());
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        data: {
          'name': name,
        },
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('User could not be created. Try again.');
      }
      return response.user!.id;
    } catch (_) {
      throw ServerException(_.toString());
    }
  }

  @override
  Future<String> twitterSignIn() {
    // TODO: implement twitterSignIn
    throw UnimplementedError();
  }

  @override
  Future<String> twitterSignUp() {
    // TODO: implement twitterSignUp
    throw UnimplementedError();
  }
}
