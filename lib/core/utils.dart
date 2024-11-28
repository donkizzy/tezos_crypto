
import 'package:flutter/material.dart';

///MediaQuery Width
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///MediaQuery Height
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  String formattedTime = "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  return "$formattedDate • $formattedTime";
}