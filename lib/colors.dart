import 'package:flutter/material.dart';

const Weekdays = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

//Color of carve
 const Color CARVE_COLORS = Color.fromRGBO(124, 123, 255, 1);


// gridant Colors 
 List<Color> listColor() {
  final List<Color> color = <Color>[];
  color.add(Color(0xFF7D7BFF));
  color.add(Color(0xFF7986CB));
  color.add(Color(0xFF9FA8DA));
  color.add(Color(0xFFC5CAE9));
  color.add(Color(0xFFFFFFFF));

  return color;
}

//gridant stops 
List<double> stopsList() {
  final List<double> stops = <double>[];
  stops.add(0.0);
  stops.add(0.2);
  stops.add(0.3);
  stops.add(0.4);
  stops.add(1);

  return stops;
}


//Linear Gradient
final LinearGradient gradientColors = LinearGradient(
    colors: listColor(),
    stops: stopsList(),
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);



//light using in Swich button
const double width = 250.0; 
const double height = 45.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Color(0xFF7D7BFF);
const Color normalColor = Colors.lightBlue;
////
///
 
