import 'package:get_it/get_it.dart';
import 'package:inkwell/core/secrets/app_secrets.dart';
import 'package:inkwell/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inkwell/feature/auth/data/repositories/auth_repository_implementation.dart';
import 'package:inkwell/feature/auth/domain/repository/auth_repository.dart';
import 'package:inkwell/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:inkwell/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.url,
    anonKey: AppSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(
    () => supabase.client,
  );
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImplementation(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(userSignUp: serviceLocator()),
  );
}
