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

  static ThemeType parseThemeType(String type) {
    switch (type) {
      case 'light':
        return ThemeType.light;
      case 'dark':
        return ThemeType.dark;
      default:
        return ThemeType.light;
    }
  }
}
