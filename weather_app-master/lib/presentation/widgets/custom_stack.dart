

import 'dart:ui';

import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {

  final String temp;
  final String desc;
  final String icon;

  CustomStack({
    Key? key,
    required this.temp,
    required this.desc,
    required this.icon
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDark? Colors.blueGrey[900] : Color(0xFF9aaff2),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                    right: 70,
                    top: 25,
                    child: Text(
                      '${temp}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 92,
                          color: isDark? Colors.orange[100] : const Color(0xFFa6c2ea)),
                    )),
                Positioned(
                    top: -60,
                    left: -15,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("${icon}"),
                    )),
                Positioned(
                    right: 15,
                    top: 19,
                    child: Text(
                      '\u00B0C',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 54,
                          color: isDark? Colors.orange[100] : const Color(0xFFa6c2ea)),
                    )),
                Positioned(
                    bottom: 20,
                    left: 30,
                    child: Text(
                      '${desc}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color:isDark? Colors.orange[100] : Colors.white),
                    ))
              ],
            );
  }
}