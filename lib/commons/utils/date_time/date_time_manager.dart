import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/date_time_format_pattern.dart';
import 'package:intl/intl.dart';

class DateTimeUtilities {
  static DateTime parseToDate(String formattedString) {
    return DateTime.parse(formattedString);
  }

  static DateTime parseUtc(String formattedString) {
    if (formattedString.isEmpty) {
      return DateTime.now();
    }
    return DateTime.parse(formattedString + 'Z');
  }

  static DateTime parseBirthDay(String birthDay) {
    return DateFormat(DateTimeFormatPattern.pattern1).parse(birthDay);
  }

  static String formatBirthDay(DateTime birthDay) {
    return DateFormat(DateTimeFormatPattern.pattern1).format(birthDay);
  }

  static String formatToDisplay(DateTime date) {
    return DateFormat(DateTimeFormatPattern.pattern2).format(date);
  }

  static String formatToSendToBackEnd(DateTime date) {
    return DateFormat(DateTimeFormatPattern.pattern1).format(date);
  }

  ///https://github.com/dart-lang/intl/issues/183
  static String formatToDisplayPattern3(DateTime date) {
    return '${DateFormat(DateTimeFormatPattern.pattern5).format(date).toLowerCase()}・${formatToDisplayPattern4(date)}';
  }

  static String formatToDisplayPattern4(DateTime date) {
    return DateFormat(DateTimeFormatPattern.pattern4).format(date);
  }

  static String formatHHMMSS(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  static String convertDurationToHourMinuteDisplay(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes';
  }

  static DateTime parseStringToDate(String? stringTime) {
    if (stringTime == null) {
      return DateTime.now();
    }
    return DateFormat('yyyy-MM-dd hh:mm:ss').parse(stringTime);
  }

  static DateTime parseStringTimestamp(String? stringTimeStamp) {
    if (stringTimeStamp == null) {
      return DateTime.now();
    }

    final timeStamp = int.tryParse(stringTimeStamp);

    return parseIntTimestamp(timeStamp);
  }

  static DateTime parseIntTimestamp(int? timeStamp) {
    if (timeStamp == null) {
      return DateTime.now();
    }
    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  static int dateToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final String hourLabel = _addLeadingZeroIfNeeded(timeOfDay.hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(timeOfDay.minute);
    return '$hourLabel:$minuteLabel';
  }

  static String _addLeadingZeroIfNeeded(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  /// check if the [compareDate] is today or not
  static bool isDateToday(DateTime compareDate) {
    final now = DateTime.now();
    return compareDate.year == now.year &&
        compareDate.month == now.month &&
        compareDate.day == now.day;
  }

  /// check if the [timeOfDay] is before now or not
  static bool isTimeOfDayBeforeNow(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final compareDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    return compareDateTime.isBefore(now);
  }
}
