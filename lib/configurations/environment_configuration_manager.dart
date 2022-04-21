import 'environment_configuration.dart';
import 'environment_type.dart';

class EnvironmentConfigurationManager {
  static late EnvironmentConfigurationManager instance;

  static void setup({
    required EnvironmentType environmentType,
    required EnvironmentConfiguration environmentConfiguration,
  }) {
    instance = EnvironmentConfigurationManager._internal(
      environmentType,
      environmentConfiguration,
    );
  }

  final EnvironmentType environment;
  final EnvironmentConfiguration environmentConfiguration;

  EnvironmentConfigurationManager._internal(
    this.environment,
    this.environmentConfiguration,
  );
}
