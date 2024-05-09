import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_r/app/ui/pages/main/screens/main_screen.dart';

import 'package:test_r/app/ui/pages/splash/providers/splash_state.dart';
import 'package:test_r/app/ui/routes/app_routes.dart';

final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
  final goRouter = ref.read(goRouterProvider); // Inyecta GoRouter
  return SplashProvider(goRouter);
});

class SplashProvider extends StateNotifier<SplashState> {
  final GoRouter _goRouter;
  SplashProvider(this._goRouter) : super(const SplashState()) {
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    await Future.delayed(const Duration(seconds: 3), () {
      _goRouter.pushReplacementNamed(MainScreen.routeName);
    });
  }
}
