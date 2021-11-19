import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'ChartData.dart';
import 'colors.dart';

//
List<ChartSeries<ChartData, String>> getSplieAreaSeries(List<ChartData> chartData ) {
 

  return <ChartSeries<ChartData, String>>[
    SplineAreaSeries<ChartData, String>(



      //Enter data on the graph
      dataSource: chartData,

      //Gradient colors under the curve
      gradient: gradientColors,


      borderWidth: 5,

      //color of carve
      borderColor:CARVE_COLORS,

      color: Colors.white,
      splineType: SplineType.natural,

      
      //dataLabelSettings: DataLabelSettings(color: Colors.amber, isVisible: true),

      //assign point values to the x- and y-axis
      xValueMapper: (ChartData sales, _) => sales.x,
      yValueMapper: (ChartData sales, _) => sales.y,

      //Settings for the points that appear on the curve
      markerSettings: MarkerSettings(
          isVisible: true,
          width: 10,
          height: 10,
          borderColor: Colors.blue,
          shape: DataMarkerType.circle,
          borderWidth: 4),

      //if you need add animation
      animationDelay: 0.1,
      animationDuration: 0.1,

      //enableTooltip: true,
    ),
  ];
}
