import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_r/app/ui/app.dart';
import 'package:test_r/dependency_injector.dart';
import 'package:test_r/enviroments/enviroment.dart';

void main() {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Enviroment.DEV,
  );
  Enviroment().initConfig(environment);
  injectDependencies();
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para que funcione el SystemChrome
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const ProviderScope(child: AppPrincipal()));
  });
}
