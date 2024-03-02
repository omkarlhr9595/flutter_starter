import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/feature/localauth/bloc/local_auth_bloc.dart';
import '../authentication/screens/auth_screen.dart';
import '../core/dependacy_injection.dart';
import '../home/screens/home_screen.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  LocalAuthBloc localAuthBloc = AppDependecyInjector.getIt.get();

  @override
  void initState() {
    localAuthBloc.add(LocalAuthInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalAuthBloc, LocalAuthState>(
      bloc: localAuthBloc,
      listener: (context, state) {
        if (state is LocalAuthFailure) {
          log('LocalAuthFailure');
        }
      },
      builder: (context, state) {
        if (state is LocalAuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is LocalAuthSuccess) {
          return const HomeScreen();
        }
        if (state is LocalAuthFailure) {
          return const AuthScreen();
        }
        return const AuthScreen();
      },
    );
  }
}
