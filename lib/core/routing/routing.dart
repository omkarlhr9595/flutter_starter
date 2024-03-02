import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_shell/shell.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Shell();
        },
      ),
    ],
  );
}
