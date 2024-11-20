import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRow extends StatelessWidget {
  final String temp_max;
  final String temp_min;
  final String feelLike;
  final String sunrise;
  final String sunset;
  final String windSpeed;

  CustomRow({
    required this.temp_max,
    required this.temp_min,
    required this.feelLike,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomCard(image: "assets/images/15.gif", tittle: "Temp(MAX)", value: temp_max),
        CustomCard(image: "assets/images/16.gif", tittle: "temp(MIN)", value: temp_min),
        CustomCard(image: "assets/images/17.gif", tittle: "Wind Speed", value: windSpeed),
        CustomCard(image: "assets/images/13.png", tittle: "Feel Like", value: feelLike),
        CustomCard(image: "assets/images/6.png", tittle: "Sunrise", value: sunrise),
        CustomCard(image: "assets/images/12.png", tittle: "Sunset", value: sunset),
      ]),
    );
  }
}

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String image;
  String tittle;
  String value;

  CustomCard({required this.image, required this.tittle, required this.value});


  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 145,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(tittle,style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            decoration: BoxDecoration(
              color: isDark? Colors.blueGrey[600] : const Color(0xFFe2e7fa),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
            ),
          ),
          Text(value,style: TextStyle(color:  isDark? Colors.orange[100] : Colors.blue[400] ,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
