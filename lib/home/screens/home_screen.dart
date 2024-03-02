import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../authentication/feature/localauth/bloc/local_auth_bloc.dart';
import '../../core/dependacy_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalAuthBloc localAuthBloc = AppDependecyInjector.getIt.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            localAuthBloc.add(LocalAuthLogoutEvent());
            localAuthBloc.add(LocalAuthInitialEvent());
            context.go('/');
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
