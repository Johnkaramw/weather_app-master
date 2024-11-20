// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextDivider extends StatelessWidget {
  String header;

  CustomTextDivider({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
               indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
          ),
          Text(
            "${header}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
