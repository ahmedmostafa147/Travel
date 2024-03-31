import 'dart:math';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HelperFunctions {
  static double distanceInKm = 0;

  static Future<List<String>> getTimeRequired({required Map speeds}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    distanceInKm = calculateDistance(
      prefs.getDouble('srcLatitude'),
      prefs.getDouble('srcLongitude'),
      prefs.getDouble('destLatitude'),
      prefs.getDouble('destLongitude'),
    );

    List<String> durations = [];
    speeds.forEach((key, speedInKmPerHour) {
      double time = distanceInKm / speedInKmPerHour;
      durations.add(durationToString((time * 60).toInt()));
    });

    // time = dist / speed
    return durations;
  }

  static String durationToString(int m) {
    final int hours = m ~/ 60;
    final int minutes = m % 60;
    return '${hours}h${minutes}m';
  }

  static int calculatePrice({required double amountPerKm}) {
    return (distanceInKm * amountPerKm).round();
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    // get distance between two positions in kilometers
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static bool checkInDate(
      String currentDate, String startDate, String endDate) { // between to date inclusive 
    if (startDate == "" && endDate == "") return false;
    DateTime begin = DateFormat("dd/MM/yyyy").parse(startDate);
    DateTime current = DateFormat("dd/MM/yyyy").parse(currentDate);
    DateTime end = DateFormat("dd/MM/yyyy").parse(endDate);
    return current.isAfter(begin.subtract(const Duration(days: 1))) &&
        current.isBefore(end.add(const Duration(days: 1)));
  }

  static bool isDatesEquals(String date1, String date2) {
    DateTime one = DateFormat("dd/MM/yyyy").parse(date1);
    DateTime two = DateFormat("dd/MM/yyyy").parse(date2);
    return one == two;
  }

  static bool checkTimeLeft({required String ticketDepTime}) {
    // Parse time1
    List<String> parts1 = ticketDepTime.split(" ");
    int hours1 = int.parse(parts1[0].split(":")[0]);
    int minutes1 = int.parse(parts1[0].split(":")[1]);
    String amPm1 = parts1[1];

    List<String> currentTimeParts =
        DateFormat("hh:mm a").format(DateTime.now()).split(" ");
    int currentHour = int.parse(currentTimeParts[0].split(":")[0]);
    int currentMinute = int.parse(currentTimeParts[0].split(":")[1]);
    String currentAmPm = currentTimeParts[1];

    // Convert to 24-hour format for comparison
    if (amPm1 == "PM" && hours1 != 12) {
      hours1 += 12;
    }

    if (currentAmPm == "PM" && currentHour != 12) {
      currentHour += 12;
    }

    // Compare times
    if (hours1 < currentHour ||
        (hours1 == currentHour && minutes1 <= currentMinute)) {
      return true; // time1 is in the past
    } else {
      return false; // time2 is in the past
    }
  }

  static isToday(String date) {
    String now = DateFormat("dd/MM/yyyy").format(DateTime.now());
    return now == date;
  }
}
