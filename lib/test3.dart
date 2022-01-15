import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample5 extends StatefulWidget {
  @override
  _LineChartSample5State createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<LineChartSample5> {
    //List<int> showIndexes = const [1,2,3, 5];
    

    //light using in Swich button
  double width = 250.0; 
  double height = 45.0;
  double loginAlign = -1;
  double signInAlign = 1;
  Color selectedColor = Color(0xFF7D7BFF);
  Color normalColor = Colors.lightBlue;


  final List<int> showIndexes = const [0, 1, 2, 3, 4, 5, 6];


//selected item
   List<int> showIndexdot = [0];


  List<Color> gradientColors = [
    Color(0xFF7D7BFF),
    Color(0xFF7986CB),
    Color(0xFF9FA8DA),
    Color(0xFFC5CAE9),
    Color(0xFFFFFFFF),
  ];
  List<Color> gradeintWhite=[
    Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white
  ]; 

  Color CARVE_COLORS = Color.fromRGBO(124, 123, 255, 1);

    List<FlSpot> allSpots = const [
    FlSpot(0, 5),
    FlSpot(1, 2),
    FlSpot(2, 5),
    FlSpot(3, 3),
    FlSpot(4, 4),
    FlSpot(5, 7),
    FlSpot(6, 8),
  ];

  


  //Variables related to  SwichButtom
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  List<bool>? isSelected;
  bool? state;


  late double touchedValue;

 

  @override
  void initState() {

    //Variables related to  SwichButtom
    isSelected = [true, false];
    state = false;
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    //

    touchedValue = -1;


 
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    List<LineChartBarData> lineBarsData = [ 

      LineChartBarData(
        //dashArray: [1,4],
       showingIndicators: showIndexdot,
          spots: allSpots,
          isCurved: state,
          barWidth: 5,
          

          
        //  lineChartStepData: LineChartStepData(),
         show: true,
         //curveSmoothness: 1,
         //preventCurveOverShooting:true,
         isStrokeCapRound: state,
        // gradientFrom: Offset(78, 10),

     
        //gradientTo:  Offset(78, 10),
       // isStepLineChart: true ,
       //lineChartStepData: LineChartStepData(stepDirection :15),
      // preventCurveOverShooting: true,
     // preventCurveOvershootingThreshold: 50,
     //showingIndicators: [1,2,3,4,5,6],

    

          belowBarData: BarAreaData(
            show: true,
            colors:state!?gradientColors:gradeintWhite,
            gradientColorStops: [0.0, 0.2, 0.3, 0.4, 1],
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
          ),
 
          //showingIndicators:[0],

          dotData: FlDotData(

            //*
            checkToShowDot: (flSpot,LineChartBarData){
              return false;
            },

              show: state!?false:true,
              getDotPainter: (spot, percent, barData, index) {

                if(index==2){
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 4,
                    strokeColor: CARVE_COLORS);
                }
                 
                 return FlDotCirclePainter(
                    radius: 0,
                    color: Colors.white,
                    strokeWidth: 4,
                    strokeColor: CARVE_COLORS);

                    
              }),


             
              
          colors: [CARVE_COLORS],
          colorStops: [0.1, 0.4, 0.9]),

    ];

    final tooltipsOnBar = lineBarsData[0];



    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(
            children: [
              Column(
                children:[
                  swichButtom(),
                  SizedBox(height: 50,),
                    chartView(tooltipsOnBar, lineBarsData),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
















  Container chartView(LineChartBarData tooltipsOnBar, List<LineChartBarData> lineBarsData) {
    return Container(
                height: 250,
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    
                       showingTooltipIndicators:showIndexes.map((index) {
                  return ShowingTooltipIndicators([
                    LineBarSpot(
                        tooltipsOnBar,
                        lineBarsData.indexOf(tooltipsOnBar),
                        tooltipsOnBar.spots[index]),
                  ]);
                }).toList(),



                  
                    lineTouchData: LineTouchData(
                      enabled:state!?true:false,
                      getTouchedSpotIndicator:
                          (LineChartBarData barData, List<int> spotIndexes) {
                        return spotIndexes.map((spotIndex) {
                          final spot = barData.spots[spotIndex];

                    
                          return TouchedSpotIndicatorData(
                            FlLine(
                                color: Color.fromRGBO(124, 123, 255, 0.1),
                                strokeWidth: 25),
                            FlDotData(
                               
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                    radius: 6,
                                    color: Colors.white,
                                    strokeWidth: 4,
                                    strokeColor: CARVE_COLORS);
                              },
                            ),
                          );
                        }).toList();
                      },

                      
                      touchTooltipData: LineTouchTooltipData(


                       // showOnTopOfTheChartBoxArea: true,
                        tooltipMargin:state!?10:5,
                        fitInsideHorizontally: true,
                       // fitInsideVertically: true,
                      //showOnTopOfTheChartBoxArea: t,
                        // maxContentWidth: 10,
                        // rotateAngle: 50,

                      


                        getTooltipItems: (value) {
                          return value
                              .map((e) => LineTooltipItem(
                                  "${e.y < 0 ? 'Expense:' : '\$'} ${e.y.toStringAsFixed(2)}",
                                  state!?TextStyle(color: Colors.white):TextStyle(color: Colors.grey)))
                              .toList();
                        },

                        tooltipBgColor:state!?Color.fromRGBO(76, 0, 161, 1):Color.fromRGBO(76, 0, 161, 0),
                       // maxContentWidth:20,
                        // tooltipBgColor: Colors.blueGrey.withOpacity(0.8) ,

                        tooltipPadding:state!?EdgeInsets.all(10):EdgeInsets.all(0),
                        tooltipRoundedRadius:state!?10:0,
                        

                  
                      ),

                      
      
                      touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
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
                      showIndexdot[0]=value.toInt();

                      });
                      return;
                    }

                    setState(() {
                      touchedValue = value;
                      showIndexdot[0]=value.toInt();

                    });
                  }

                    ),



                    lineBarsData: lineBarsData,

                    minY: 0,



                    titlesData: FlTitlesData(


                      bottomTitles: SideTitles(
                          showTitles: true,
                          
                          getTitles: (val) {
                            switch (val.toInt()) {
                              case 0:
                                return 'Sat';
                              case 1:
                                return 'Sun';
                              case 2:
                                return 'Mon';
                              case 3:
                                return 'Tue';
                              case 4:
                                return 'Wed';
                              case 5:
                                return 'Thu';
                              case 6:
                                return 'Fri';
                            }
                            return '';  
                          },

                          

                      //  reservedSize: 50,
                        interval:1,
                        margin:0,                    
                          getTextStyles: (context, value) { 

                            //final isTouched = value == showIndexdot[0];
                             final isTouched = value == touchedValue;
                            return isTouched?   TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,  
                                backgroundColor:Color.fromRGBO(124, 123, 255, 0.1),
                              ):TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              );
                          }
                              ),

                                  leftTitles: SideTitles(
                               showTitles: false,
                       
                      ),

                      rightTitles: SideTitles(

                        showTitles: false,
                       
                        )
                        
                        
                        
                        ,
                      topTitles: SideTitles(showTitles: false),
                    ),
                    axisTitleData: FlAxisTitleData(

                      rightTitle: AxisTitle(
                          showTitle: false,
                          textStyle: TextStyle(fontSize: 2),
                          titleText: ''
                          
                          ),
                      leftTitle: AxisTitle(
                        showTitle: false, titleText: 'count'
                      ),
                      

                    ),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(
                      show: false,
                      
                    ),

 

                    
                  ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
  swapAnimationCurve: Curves.linear, // Opti
              
                ),
              );
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


}



 