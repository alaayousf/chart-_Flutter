//import 'package:chart/chart.dart';
import 'package:chart/provider.dart';
import 'package:chart/test4.dart';
import 'package:flutter/material.dart';
import 'test.dart';
import 'data.dart';
import 'test3.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => providerclass(state:false)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LineChartSample5(),
      ),
    );
  }
}

