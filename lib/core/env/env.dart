import 'package:envied/envied.dart';

part 'env.g.dart';

enum EnvironmentType { dev, prod }

EnvironmentType currentEnvironment = EnvironmentType.dev;

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
}



