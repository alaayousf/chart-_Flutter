// import 'package:chart/provider.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math';

// class Value extends StatefulWidget {
// //

//   const Value({Key? key}) : super(key: key);

//   @override
//   _ValueState createState() => _ValueState();
// }

// class _ValueState extends State<Value> {
//   final List<int> showIndexes = const [2];

//   final List<FlSpot> allSpots = const [
//     FlSpot(0, 1),
//     FlSpot(1, 2),
//     FlSpot(2, 1.5),
//     FlSpot(3, 3),
//     FlSpot(4, 3.5),
//     FlSpot(5, 5),
//     FlSpot(6, 8),
//   ];


//   final List<FlSpot> allSpots2 = const [
//     FlSpot(0, 5),
//     FlSpot(1, 3),
//     FlSpot(2, 8),
//     FlSpot(3, 9),
//     FlSpot(4, 2),
//     FlSpot(5, 3),
//     FlSpot(6, 12),
//   ];


//  @override
//   void initState() {

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//      var infFromProvide = Provider.of<providerclass>(context);
    
//     final lineBarsData = [

//       LineChartBarData(
//            showingIndicators: showIndexes,
//           spots: allSpots,
//           isCurved: true,
//           barWidth: 4,
//           shadow: const Shadow(
//             blurRadius: 8,
//             color: Colors.black,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors: [
//               const Color(0xff12c2e9).withOpacity(0.4),
//               const Color(0xffc471ed).withOpacity(0.4),
//               const Color(0xfff64f59).withOpacity(0.4),
//             ],
//           ),
//           dotData: FlDotData(show: true),
//           colors: [
//             const Color(0xff12c2e9),
//             const Color(0xffc471ed),
//             const Color(0xfff64f59),
//           ],
//           colorStops: [
//             0.1,
//             0.4,
//             0.9
//           ]),

//     ];





















//     final tooltipsOnBar = lineBarsData[0];

//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 300,
//           height: 140,
//           child: GestureDetector(

             
//               // infFromProvide.setState(false);

//             child: LineChart(

//               LineChartData(


//                 backgroundColor: Colors.amber,

//                 lineTouchData: LineTouchData(
//                   enabled:infFromProvide.state ,
//                 ),


//                 showingTooltipIndicators:showIndexes.map((index) {
//                   return ShowingTooltipIndicators([
//                     LineBarSpot(
//                         tooltipsOnBar,
//                         lineBarsData.indexOf(tooltipsOnBar),
//                         tooltipsOnBar.spots[index]),
//                   ]);
//                 }).toList(),








//                 lineBarsData: lineBarsData,
//                 minY: 0,
//                 titlesData: FlTitlesData(
//                   leftTitles: SideTitles(
//                     showTitles: false,
//                   ),
//                   bottomTitles: SideTitles(
//                       showTitles: true,
//                       getTitles: (val) {
//                         switch (val.toInt()) {
//                           case 0:
//                             return '00:00';
//                           case 1:
//                             return '04:00';
//                           case 2:
//                             return '08:00';
//                           case 3:
//                             return '12:00';
//                           case 4:
//                             return '16:00';
//                           case 5:
//                             return '20:00';
//                           case 6:
//                             return '23:59';
//                         }
//                         return '';
//                       },
//                       getTextStyles: (context, value) => const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blueGrey,
//                             fontFamily: 'Digital',
//                             fontSize: 18,
//                           )),
//                   rightTitles: SideTitles(showTitles: false),
//                   topTitles: SideTitles(showTitles: false),
//                 ),
        
//                 gridData: FlGridData(show: false),
//                 borderData: FlBorderData(
//                   show: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


 
   
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LineChartSample3 extends StatefulWidget {
  final weekDays = const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  final List<double> yValues = const [1.3, 1, 1.8, 1.5, 2.2, 1.8, 3];

  const LineChartSample3({Key? key}) : super(key: key);

  @override
  State createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {
  late double touchedValue;

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'Average Line',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              ' and ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              'Indicators',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          width: 300,
          height: 140,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      final spot = barData.spots[spotIndex];
                      if (spot.x == 0 || spot.x == 6) {
                        return null;
                      }
                      return TouchedSpotIndicatorData(
                        FlLine(color: Colors.blue, strokeWidth: 4),
                        FlDotData(
                          getDotPainter: (spot, percent, barData, index) {
                            if (index % 2 == 0) {
                              return FlDotCirclePainter(
                                  radius: 8,
                                  color: Colors.white,
                                  strokeWidth: 5,
                                  strokeColor: Colors.deepOrange);
                            } else {
                              return FlDotSquarePainter(
                                size: 16,
                                color: Colors.white,
                                strokeWidth: 5,
                                strokeColor: Colors.deepOrange,
                              );
                            }
                          },
                        ),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot;
                          if (flSpot.x == 0 || flSpot.x == 6) {
                            return null;
                          }

                          return LineTooltipItem(
                            '${widget.weekDays[flSpot.x.toInt()]} \n',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: flSpot.y.toString(),
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const TextSpan(
                                text: ' k ',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const TextSpan(
                                text: 'calories',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      }
                      ),


                  touchCallback:
                      (FlTouchEvent event, LineTouchResponse? lineTouch) {
                    if (!event.isInterestedForInteractions ||
                        lineTouch == null ||
                        lineTouch.lineBarSpots == null) {
                      setState(() {
                        touchedValue = -1;
                      });
                      return;
                    }
                    final value = lineTouch.lineBarSpots![0].x;

                    if (value == 0 || value == 6) {
                      setState(() {
                        touchedValue = -1;
                      });
                      return;
                    }

                    setState(() {
                      touchedValue = value;
                    });
                  }),
              extraLinesData: ExtraLinesData(horizontalLines: [
                HorizontalLine(
                  y: 1.8,
                  color: Colors.green.withOpacity(0.8),
                  strokeWidth: 3,
                  dashArray: [20, 2],
                ),
              ]),
              lineBarsData: [
                LineChartBarData(
                  isStepLineChart: true,
                  spots: widget.yValues.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: false,
                  barWidth: 4,
                  colors: [
                    Colors.orange,
                  ],
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [
                      Colors.orange.withOpacity(0.5),
                      Colors.orange.withOpacity(0.0),
                    ],
                    gradientColorStops: [0.5, 1.0],
                    gradientFrom: const Offset(0, 0),
                    gradientTo: const Offset(0, 1),
                    spotsLine: BarAreaSpotsLine(
                      show: true,
                      flLineStyle: FlLine(
                        color: Colors.blue,
                        strokeWidth: 2,
                      ),
                      checkToShowSpotLine: (spot) {
                        if (spot.x == 0 || spot.x == 6) {
                          return false;
                        }

                        return true;
                      },
                    ),
                  ),
                  dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        if (index % 2 == 0) {
                          return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.white,
                              strokeWidth: 3,
                              strokeColor: Colors.deepOrange);
                        } else {
                          return FlDotSquarePainter(
                            size: 12,
                            color: Colors.white,
                            strokeWidth: 3,
                            strokeColor: Colors.deepOrange,
                          );
                        }
                      },
                      checkToShowDot: (spot, barData) {
                        return spot.x != 0 && spot.x != 6;
                      }),
                ),
              ],
              minY: 0,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                      color: Colors.deepOrange,
                      strokeWidth: 2,
                    );
                  } else {
                    return FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
                getDrawingVerticalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                      color: Colors.black,
                      strokeWidth: 2,
                    );
                  } else {
                    return FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '';
                      case 1:
                        return '1k calories';
                      case 2:
                        return '2k calories';
                      case 3:
                        return '3k calories';
                    }

                    return '';
                  },
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.black, fontSize: 10),
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: (value) {
                    return widget.weekDays[value.toInt()];
                  },
                  getTextStyles: (context, value) {
                    final isTouched = value == touchedValue;
                    return TextStyle(
                      color: isTouched
                          ? Colors.deepOrange
                          : Colors.deepOrange.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
 