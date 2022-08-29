import 'package:bmi_calculator/card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class result_page extends StatelessWidget {
  result_page(
      {@required this.bmi, @required this.brief, @required this.result});
  final String bmi;
  final String result;
  final String brief;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Result",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
                flex: 5,
                child: card(
                  colour: Colors.teal,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: TextStyle(fontSize: 30.0, color: Colors.amber),
                      ),
                      Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        brief,
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      )
                    ],
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                    child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                )),
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: botton_color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                width: double.infinity,
                height: bottom_height,
              ),
            ),
          ],
        ));
  }
}
