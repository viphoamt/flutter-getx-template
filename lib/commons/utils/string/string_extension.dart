extension StringExtension on String {
  // BA logic: if full name > 10 -> show 7 characters and ...
  String shortenFullName({int limit = 10}) {
    const dot = '...';
    if (length < dot.length || length < limit) {
      return this;
    }
    return substring(0, limit - dot.length) + dot;
  }

  String get stringFirebase {
    return '"' + this + '"';
  }
}
