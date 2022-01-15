import 'package:chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

const double width = 250.0;
const double height = 45.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Color(0xFF7D7BFF);
const Color normalColor = Colors.lightBlue;

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  List<Color> gradientColors = [
    const Color(0xFF7D7BFF),
    const Color(0xffffffff),
  ];

  List<bool>? isSelected;
  bool? state;

  @override
  void initState() {
    isSelected = [true, false];
    state = false;
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('My Wallet',),

                  // Text('My Wallet'),
                ],
              ),
            ),

            Center(
              child: Container(
                width: width,
                height: 65,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 240, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(xAlign, 0),
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        width: width * 0.5,
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (state == false) {
                            state = true;
                          } else {
                            state = false;
                          }
                          xAlign = loginAlign;
                          loginColor = selectedColor;

                          signInColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: loginColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (state == false) {
                            state = true;
                          } else {
                            state = false;
                          }

                          xAlign = signInAlign;
                          signInColor = selectedColor;

                          loginColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Spending',
                            style: TextStyle(
                              color: signInColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

/**/ ////////////////////////////////////////////////////////////////////////////////////////////// */

            Container(
              width: size.width,
              height: size.height * 0.33,
              color: Colors.white,
              child: Padding( 

                padding: const EdgeInsets.only(left: 10),
                child: LineChart(
                  


                  LineChartData(
                      axisTitleData: FlAxisTitleData(

                        show: true,
                        bottomTitle: AxisTitle(showTitle: true,titleText: "wwwwww",)
                      ),

                      //minX:0.5 ,
                      //     axisTitleData:FlAxisTitleData(show: true,bottomTitle:AxisTitle(titleText: "dddddd",showTitle: true,textAlign:TextAlign.center,) ) ,
                      //backgroundColor: Colors.amber,
                      //  clipData:FlClipData.all() ,

                      lineTouchData: LineTouchData(

                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((spotIndex) {
                              final spot = barData.spots[spotIndex];
                              if (spot.x == 0 || spot.x == 6) {
                                return null;
                              }
                              return TouchedSpotIndicatorData(
                                FlLine(color: Colors.blue, strokeWidth: 10),
                                FlDotData(
                                  getDotPainter:
                                      (spot, percent, barData, index) {
                                    return FlDotCirclePainter(
                                        radius: 8,
                                        color: Colors.white,
                                        strokeWidth: 5,
                                        strokeColor: Colors.deepOrange);
                                  },
                                ),
                              );
                            }).toList();
                          },

                          //  handleBuiltInTouches: true,

                          touchSpotThreshold: 50,
                          touchTooltipData: LineTouchTooltipData(
                            //tooltipMargin: 50,
                            //  fitInsideHorizontally: false,
                            // maxContentWidth: 10,
                            // rotateAngle: 50,

                            getTooltipItems: (value) {
                              return value
                                  .map((e) => LineTooltipItem(
                                      "${e.y < 0 ? 'Expense:' : '%:'} ${e.y.toStringAsFixed(2)}",
                                      TextStyle(color: Colors.white)))
                                  .toList();
                            },

                            tooltipBgColor: Color(0xFF7D7BFF),
                            // tooltipBgColor: Colors.blueGrey.withOpacity(0.8) ,
                            tooltipPadding: EdgeInsets.all(10),
                            tooltipRoundedRadius: 10,
                          )),
                          rangeAnnotations:RangeAnnotations() ,


                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                          //   margin: 20,
                          showTitles: false,
                        ),
                        rightTitles: SideTitles(showTitles: false),
                        topTitles: SideTitles(
                          showTitles: false,
                        ),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          //interval: 1,
                          getTextStyles: (e, r) {
                            return TextStyle(color: Colors.red);
                          },

                          getTitles: (value) {
                            switch (value.toInt()) {
                              case 1:
                                return 'Mon';
                              case 2:
                                return 'Tues';
                              case 3:
                                return 'Wed';
                              case 4:
                                return 'Thu';
                              case 5:
                                return 'Fri';
                              case 6:
                                return 'Sat';
                              case 7:
                                return 'Sun';
                            }
                            return '';
                          },

                          // showTitles: true,
                          // //reservedSize: 22,
                          // interval:5,
                          // getTextStyles: (e, d) {
                          //   return const TextStyle(
                          //     color: Color(0xFFBEBEBE),
                          //     fontSize: 12,
                          //     decorationColor: Colors.amber,
                          //     fontWeight: FontWeight.bold,
                          //   );
                          // },
                          // getTitles: (value) {
                          //   print('bottomTitles $value');
                          //   switch (value.toInt()) {
                          //     case 0:
                          //       return 'TES';
                          //     case 1:
                          //       return 'MAR';
                          //     case 2:
                          //       return 'JUN';
                          //     case 3:
                          //       return 'SEP';
                          //     // case 4:
                          //     //   return 'MAR';
                          //     // case 5:
                          //     //   return 'JUN';
                          //     // case 6:
                          //     //   return 'SEP';
                          //   }
                          //   return '';
                          // },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minY: 0,
                      maxY: 10,
                      maxX: 8,
                      gridData: FlGridData(show: false),

                      lineBarsData: [

                        LineChartBarData(
                           
                          spots: [
                            // FlSpot(x,y),
                            FlSpot(0, 3),
                            FlSpot(2.6, 2),
                            FlSpot(4.9, 10),
                            FlSpot(6.8, 3.1),
                          ],

                          //FlSpot(2.6, 4),

                          isCurved: state,
                          //showingIndicators: ,
                          colors: [
                            gradientColors[0],
                          ],


                          barWidth: 3,

                         // shadow: Shadow(color: Colors.red,offset: Offset(0,3.5)),
                        

                          //isStrokeCapRound: true,

                          dotData: FlDotData(
                            show: true,
                          ),

                         // aboveBarData:BarAreaData(show: true) ,
                         

                          belowBarData: BarAreaData(
                            show: true,
                            colors: gradientColors,
                            gradientColorStops: [5, 0, 0],
                            gradientFrom: const Offset(0, 0),
                            gradientTo: const Offset(0, 1),
                          ),
                        )
                      ]),

                      
                  swapAnimationDuration:
                      Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Opt
                ),
              ),
            ),
          ],
        ));
  }
}
