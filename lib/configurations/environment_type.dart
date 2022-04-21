enum EnvironmentType {
  dev,
  stag,
  prod,
}

extension EnvironmentTypeExtension on EnvironmentType {
  String get dotenvFilePath {
    return 'environments/$_dotenvFileName';
  }

  String get _dotenvFileName {
    switch (this) {
      case EnvironmentType.dev:
        return 'dev.env';
      case EnvironmentType.stag:
        return 'stag.env';
      case EnvironmentType.prod:
        return 'prod.env';
    }
  }
}
