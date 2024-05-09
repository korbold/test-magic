import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_r/app/ui/pages/card_list/screens/card_details_screen.dart';
import 'package:test_r/app/ui/pages/card_list/screens/card_list_screen.dart';
import 'package:test_r/app/ui/pages/main/screens/main_screen.dart';
import 'package:test_r/app/ui/pages/splash/screens/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        path: '/main',
        name: MainScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(child: MainScreen()),
      ),
      GoRoute(
        path: '/card_list',
        name: CardListScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(child: CardListScreen()),
      ),
      GoRoute(
        path: '/card_details',
        name: CardDetailsScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(child: CardDetailsScreen()),
      ),
    ],
  );
});
