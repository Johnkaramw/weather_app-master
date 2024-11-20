import 'package:flutter/material.dart';
import 'dart:async';

import 'package:weatherapi/locals/shared.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Shared.getBOOL(key: "done")?
      Navigator.pushReplacementNamed(context, '/home'): 
      Navigator.pushReplacementNamed(context, '/onboarding'); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flash_on, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Welcome To Weather App!", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}



