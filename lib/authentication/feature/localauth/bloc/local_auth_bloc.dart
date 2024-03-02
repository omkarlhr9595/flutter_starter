import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/authentication/feature/localauth/services/token_service.dart';

part 'local_auth_event.dart';
part 'local_auth_state.dart';

class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  LocalAuthBloc() : super(LocalAuthInitial()) {
    on<LocalAuthInitialEvent>(localAuthInitialEvent);
    on<LocalAuthLogoutEvent>(localAuthLogoutEvent);
    on<LocalAuthLoginEvent>(localAuthLoginEvent);
  }

  FutureOr<void> localAuthInitialEvent(
    event,
    emit,
  ) async {
    emit(LocalAuthLoading());

    Future.delayed(const Duration(seconds: 5));

    String token = await TokenService.getToken();

    log('token: $token');

    if (token.isEmpty) {
      emit(LocalAuthFailure());
      return;
    }

    bool isTokenValid = await TokenService.isTokenValid();

    log('isTokenValid: $isTokenValid');

    if (!isTokenValid) {
      await TokenService.deleteToken();
      emit(LocalAuthFailure());
      return;
    }

    log('LocalAuthSuccess');

    emit(LocalAuthSuccess());
  }

  FutureOr<void> localAuthLogoutEvent(
    LocalAuthLogoutEvent event,
    Emitter<LocalAuthState> emit,
  ) {
    emit(LocalAuthLoading());
    TokenService.deleteToken();
    emit(LocalAuthFailure());
  }

  FutureOr<void> localAuthLoginEvent(
    LocalAuthLoginEvent event,
    Emitter<LocalAuthState> emit,
  ) async {
    emit(LocalAuthLoading());
    await TokenService.setToken('token');
    emit(LocalAuthSuccess());
  }
}
