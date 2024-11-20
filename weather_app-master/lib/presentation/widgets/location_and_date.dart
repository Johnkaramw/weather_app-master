// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class LocationAndDate extends StatelessWidget {
  final String location;
  final String day;
  final String date;
  final String month;
  final String time;


  const LocationAndDate({
    Key? key,
    required this.location,
    required this.day,
    required this.date,
    required this.month,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "${location}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "${time}",
            style: TextStyle(
              color: isDark? Colors.white:Colors.black.withOpacity(.5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "${day}, ${date} ${month}",
            style: TextStyle(
              color: isDark? Colors.white:Colors.black.withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }
}
