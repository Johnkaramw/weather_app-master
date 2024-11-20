import 'package:flutter/material.dart';

class BadResponsePage extends StatelessWidget {
  const BadResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: isDark? Colors.blueGrey[800]: Color(0xFFe2e7fa)),
      // height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
      margin: EdgeInsets.fromLTRB(40, 80, 40, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Bad Response",
              style: TextStyle(
                  color: isDark?  Colors.orange[300]:Colors.blue ,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
          ),
          Center(
            child: Text(
              "City Not Found",
              style: TextStyle(
                  color: isDark? Colors.orange[200] :Colors.blue ,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Try:",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Padding(
            padding:  EdgeInsets.fromLTRB(15, 0, 0, 0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1-Enter Valid City Name.",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "2-Refresh The Page From App Tittle.",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "3-Ensure Internet Conectivity.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
