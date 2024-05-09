// ignore_for_file: constant_identifier_names

import 'base_config.dart';
import 'debug_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class Enviroment {
  factory Enviroment() {
    return _singleton;
  }

  Enviroment._internal() : config = DevConfig();

  static final Enviroment _singleton = Enviroment._internal();

  static const String DEV = 'DEV';
  static const String PROD = 'PROD';
  static const String DEBUG = 'DEBUG';

  BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Enviroment.PROD:
        return ProdConfig();
      case Enviroment.DEBUG:
        return DebugConfig();
      default:
        return DevConfig();
    }
  }
}
