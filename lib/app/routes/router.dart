import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trainsup/features/account/presentation/auth_screen.dart';
import 'package:trainsup/features/account/presentation/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return AuthScreen(); // Всегда открываем AuthScreen
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen(); // Экран после успешной авторизации
      },
    ),
  ],
);