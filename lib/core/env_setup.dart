import 'package:envied/envied.dart';

part 'env_setup.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'CLIENT_ID', obfuscate: true)
  static final clientId = _Env.clientId;
}
