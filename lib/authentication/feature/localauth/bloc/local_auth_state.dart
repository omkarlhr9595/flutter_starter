part of 'local_auth_bloc.dart';

@immutable
sealed class LocalAuthState {}

final class LocalAuthInitial extends LocalAuthState {}

final class LocalAuthLoading extends LocalAuthState {}

final class LocalAuthSuccess extends LocalAuthState {}

final class LocalAuthFailure extends LocalAuthState {}
