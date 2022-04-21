import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'environment_configuration.dart';
import 'environment_configuration_manager.dart';
import 'environment_type.dart';

class AppConfigurationManager {
  static Future<void> configure({
    required EnvironmentType environmentType,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      dotenv.load(fileName: environmentType.dotenvFilePath),
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    ]);

    EnvironmentConfigurationManager.setup(
      environmentType: environmentType,
      environmentConfiguration: EnvironmentConfiguration(
        baseUrl: dotenv.env['baseUrl']!,
      ),
    );
  }
}
