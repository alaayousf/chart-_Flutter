import 'package:flutter/material.dart';
import 'ChartData.dart';
import 'chartSmooth.dart';
import 'colors.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chartEdg.dart';

 

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

  
/// State class of the spline area chart.
class _ChartState extends State<Chart> {
  late List<ChartData> dataSource;


  //Variables related to  SwichButtom
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  List<bool>? isSelected;
  bool? state;

  @override
  void initState() {

    //Variables related to  SwichButtom
    isSelected = [true, false];
    state = false;
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    //



    // ceate Chart Data
    dataSource = [
      ChartData('${Weekdays[1]}', 0.5),
      ChartData('${Weekdays[2]}', 1),
      ChartData('${Weekdays[3]}', 0.5),
      ChartData('${Weekdays[4]}', 0.6),
      ChartData('${Weekdays[5]}', 0.7),
      ChartData('${Weekdays[6]}', 0.8),
      ChartData('${Weekdays[7]}', 0.5),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 20),
        child: Column(
          children: [

            //I switch between the two cases "between the sharp-angled curve and the smooth curve"
            swichButtom(),

            //This function drawing the Cartesian plane and contains the settings for the general appearance of the plane
            buildChartChart(),
          ],
        ),
      ),
    ));
  }




  Center swichButtom() {
    return Center(
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
                  state = false;

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
                  xAlign = signInAlign;

                  signInColor = selectedColor;

                  loginColor = normalColor;

                  state = true;
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
    );
  }



  ////////////////////////////////////////////////////////////








  /// Returns the cartesian spline are chart.
  SfCartesianChart buildChartChart() {
    return SfCartesianChart(
      //Border width of the plot area.
      plotAreaBorderWidth: 0.0,

      //you can add margin
      //margin: EdgeInsets.only(left: 10,right: 10),

      //Creating an argument constructor of SfCartesianChart class
      //X-axis display control
      primaryXAxis: CategoryAxis(
          labelPosition: ChartDataLabelPosition.inside,
          labelAlignment: LabelAlignment.center,

          //Hide the gridlines of x-axis
          majorGridLines: MajorGridLines(width: 0),
          // edgeLabelPlacement: EdgeLabelPlacement.none,

          labelPlacement: LabelPlacement.onTicks,
          majorTickLines: MajorTickLines(size: 0),
          isInversed: false,

          //Hide the axis line of x-axis
          axisLine: AxisLine(width: 0),
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          )),

      ////Y-axis display control
      primaryYAxis: NumericAxis(
          //Hide the gridlines of y-axis
          isVisible: false,
          majorGridLines: MajorGridLines(width: 0),
          //Hide the axis line of y-axis
          axisLine: AxisLine(width: 0)),

      //Very important comment................
      //You switch between my curved shapes

      series: state! ? getSplieAreaSeries(dataSource) : chartEdg(dataSource),

      // This is the transparent vertical bar that appears as the Track bar
      trackballBehavior: TrackballBehavior(
          enable: true,
          lineColor: Color.fromRGBO(124, 123, 255, 0.1),
          lineWidth: 30,

          // This empty container was built for me, hide me, hide dialogue
          builder: (BuildContext context, TrackballDetails trackballDetails) {
            return Container();
          },
          // lineDashArray: [1,3,5,6,8],
          activationMode: ActivationMode.singleTap),

      //The tips that appear when you click on the points
      tooltipBehavior: TooltipBehavior(
          enable: true,
          // tooltipPosition: TooltipPosition.pointer,
          decimalPlaces: 1,
          elevation: 20,
          color: Color.fromRGBO(76, 0, 161, 1),
          format: '\$point.y',
          header: '',
          canShowMarker: false,
          activationMode: ActivationMode.singleTap,
          textStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
