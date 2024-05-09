import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_r/app/ui/pages/splash/providers/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashProvider);
    return Scaffold(
      body: Center(
        child: Image.asset("assets/pngwing.com.png", width: 200, height: 200),
      ),
    );
  }
}
