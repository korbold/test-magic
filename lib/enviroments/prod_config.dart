import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get baseUrl => "https://api.magicthegathering.io/v1";
}
