import 'package:flutter/material.dart';
import 'package:flutter_starter/core/dependacy_injection.dart';

import '../feature/localauth/bloc/local_auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  LocalAuthBloc localAuthBloc = AppDependecyInjector.getIt.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            localAuthBloc.add(LocalAuthLoginEvent());
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
