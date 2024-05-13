import 'package:inkwell/core/error/exceptions.dart';
import 'package:inkwell/feature/auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<ProfileModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<ProfileModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<ProfileModel> googleSignUp();

  Future<ProfileModel> googleSignIn();

  Future<ProfileModel> facebookSignUp();

  Future<ProfileModel> facebookSignIn();

  Future<ProfileModel> appleSignUp();

  Future<ProfileModel> appleSignIn();

  Future<ProfileModel> twitterSignUp();

  Future<ProfileModel> twitterSignIn();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  // This is called as Dependency Injection. When the class is initialized, the database is passed to the constructor
  // This is done to avoid dependency creation between the class and the database and for testing
  final SupabaseClient client;
  AuthRemoteDataSourceImplementation(this.client);

  @override
  Future<ProfileModel> appleSignIn() {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> appleSignUp() {
    // TODO: implement appleSignUp
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> facebookSignIn() {
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> facebookSignUp() {
    // TODO: implement facebookSignUp
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> googleSignUp() {
    // TODO: implement googleSignUp
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return ProfileModel.fromJson(response.user!.toJson());
    } catch (_) {
      throw ServerException(_.toString());
    }
  }

  @override
  Future<ProfileModel> signUpWithEmailPassword({
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
      return ProfileModel.fromJson(response.user!.toJson());
    } catch (_) {
      throw ServerException(_.toString());
    }
  }

  @override
  Future<ProfileModel> twitterSignIn() {
    // TODO: implement twitterSignIn
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> twitterSignUp() {
    // TODO: implement twitterSignUp
    throw UnimplementedError();
  }
}
