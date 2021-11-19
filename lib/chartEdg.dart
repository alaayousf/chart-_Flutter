import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'ChartData.dart';
import 'colors.dart';



List<CartesianSeries> chartEdg(List<ChartData> dataSource) {
  return <CartesianSeries>[
    AreaSeries<ChartData, String>(

      //Enter data on the graph
      dataSource: dataSource,




   

     //color of carve
      borderColor:CARVE_COLORS,
      color: Colors.white,


      //enableTooltip: false,


      //assign point values to the x- and y-axis
      xValueMapper: (ChartData data, _) => data.x,
      yValueMapper: (ChartData data, _) => data.y,


      //data Label Settings_"The value that appears above the point"
      dataLabelSettings: DataLabelSettings(
          isVisible: true, textStyle: TextStyle(color: Colors.grey)),
      borderWidth: 5,


   //Settings for the points that appear on the curve
      markerSettings: MarkerSettings(
          isVisible: true,
          width: 10,
          height: 10,
          borderColor: Colors.blue,
          shape: DataMarkerType.circle,
          borderWidth: 3
          ),


      //if you need add animation 
      animationDelay: 0.0,
      animationDuration: 0.0,

     
      //   borderDrawMode:BorderDrawMode. top,

    )
  ];
}