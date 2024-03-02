part of 'local_auth_bloc.dart';

@immutable
sealed class LocalAuthEvent {}

final class LocalAuthInitialEvent extends LocalAuthEvent {}

final class LocalAuthLogoutEvent extends LocalAuthEvent {}

final class LocalAuthLoginEvent extends LocalAuthEvent {}
