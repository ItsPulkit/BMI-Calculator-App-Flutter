import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.tealAccent)),
          scaffoldBackgroundColor: Color(
            0xFF0A0E21,
          )),
      home: Input_page(),
    );
  }
}
