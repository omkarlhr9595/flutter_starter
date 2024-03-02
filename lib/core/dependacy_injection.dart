import 'package:flutter_starter/authentication/feature/localauth/bloc/local_auth_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class AppDependecyInjector {
  static final getIt = GetIt.instance;

  static void setupAppDependecyInjector() {
    _getLocalAuthBloc();
  }

  static void _getLocalAuthBloc() {
    getIt.registerLazySingleton<LocalAuthBloc>(() => LocalAuthBloc());
  }
}
