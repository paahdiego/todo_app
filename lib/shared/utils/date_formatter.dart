class DateFormatter {
  static String formattedDate(DateTime date) {
    final day = date.day;
    final month = date.month;
    final year = date.year;

    String formattedDate = day.toString();

    if (day < 10) formattedDate = "0$day";
    if (month < 10) {
      formattedDate += "/0$month";
    } else {
      formattedDate += "/$month";
    }

    formattedDate += "/$year";
    return formattedDate;
  }

  static String formattedDateTime(DateTime date) {
    String formattedDateTime = DateFormatter.formattedDate(date);

    final hour = date.hour;
    final minutes = date.minute;

    if (hour < 10) {
      formattedDateTime += " 0$hour";
    } else {
      formattedDateTime += " $hour";
    }
    if (minutes < 10) {
      formattedDateTime += ":0$minutes";
    } else {
      formattedDateTime += ":$minutes";
    }

    return formattedDateTime;
  }

  static String timeAgo({
    required DateTime dateTime,
  }) {
    final timeAgo = dateTime.difference(DateTime.now());
    final days = timeAgo.inDays.abs();
    final minutes = timeAgo.inMinutes.abs();
    final hours = timeAgo.inHours.abs();

    if (days > 0) {
      String daysAgo = days.toString();

      return "$daysAgo dias atrás";
    } else if (hours >= 1) {
      String hoursAgo = hours.toString();

      return "${hoursAgo}h";
    } else {
      String minutesAgo = minutes.toString();

      return "${minutesAgo}m";
    }
  }
}
