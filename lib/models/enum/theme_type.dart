enum ThemeType { light, dark }

extension ThemeTypeExtension on ThemeType {
  String get themeType {
    switch (this) {
      case ThemeType.light:
        return 'light';
      case ThemeType.dark:
        return 'dark';
    }
  }

  static ThemeType parseLanguageCode(String type) {
    switch (type) {
      case 'en':
        return ThemeType.light;
      case 'vi':
        return ThemeType.dark;
      default:
        return ThemeType.light;
    }
  }
}
