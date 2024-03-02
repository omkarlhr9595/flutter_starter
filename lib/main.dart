import 'package:flutter/material.dart';
import 'package:flutter_starter/core/dependacy_injection.dart';
import 'package:flutter_starter/core/routing/routing.dart';

void main() {
  AppDependecyInjector.setupAppDependecyInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
