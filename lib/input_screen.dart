import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_card.dart';
import 'card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bmibrain.dart';

const bottom_height = 65.0;
const botton_color = Colors.pink;
const card_color = Colors.teal;
const cardactivecolor = Colors.tealAccent;
const cardinactivecolor = Colors.teal;

enum Gender { male, female }

class Input_page extends StatefulWidget {
  @override
  _Input_pageState createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  Color malecardcolor = cardinactivecolor;
  Color femalecardcolor = cardinactivecolor;

  Gender SeletedGender;
  int height = 150;
  int weight = 60;
  int age = 21;
  // void gendercolor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (malecardcolor == cardinactivecolor) {
  //       malecardcolor = cardactivecolor;
  //       femalecardcolor = cardinactivecolor;
  //     } else {
  //       malecardcolor = cardinactivecolor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femalecardcolor == cardinactivecolor) {
  //       femalecardcolor = cardactivecolor;
  //       malecardcolor = cardinactivecolor;
  //     } else {
  //       femalecardcolor = cardinactivecolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: card(
                    onpress: () {
                      setState(() {
                        SeletedGender = Gender.male;
                      });
                    },
                    colour: SeletedGender == Gender.male
                        ? cardactivecolor
                        : cardinactivecolor,
                    cardchild: card_content_icon(FontAwesomeIcons.mars, 'Male'),
                  ),
                ),
                Expanded(
                    child: card(
                        onpress: () {
                          setState(() {
                            SeletedGender = Gender.female;
                          });
                        },
                        colour: SeletedGender == Gender.female
                            ? cardactivecolor
                            : cardinactivecolor,
                        cardchild: card_content_icon(
                            FontAwesomeIcons.venus, 'Female'))),
              ],
            ),
          ),
          Expanded(
              child: card(
            colour: card_color,
            cardchild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Height",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kTextStyle,
                    ),
                    Text(
                      "cm",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                      overlayColor: Colors.pink[100],
                      thumbColor: Colors.pink,
                      activeTrackColor: Colors.white),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 250.0,
                    inactiveColor: Colors.grey,
                    onChanged: (double newVlue) {
                      setState(() {
                        height = newVlue.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: card(
                  colour: card_color,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black)),
                      Text(
                        weight.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundbutton(
                              iconss: FontAwesomeIcons.minus,
                              onpresses: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          Roundbutton(
                              iconss: FontAwesomeIcons.plus,
                              onpresses: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: card(
                  colour: card_color,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black)),
                      Text(
                        age.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundbutton(
                              iconss: FontAwesomeIcons.minus,
                              onpresses: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          Roundbutton(
                              iconss: FontAwesomeIcons.plus,
                              onpresses: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bmibrain calc = bmibrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => result_page(
                          bmi: calc.Calcluatebmi(),
                          brief: calc.brief(),
                          result: calc.Result(),
                        )),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                'Calculate',
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
          )
        ],
      ),
    );
  }
}

class Roundbutton extends StatelessWidget {
  Roundbutton({@required this.iconss, @required this.onpresses});
  final IconData iconss;
  final Function onpresses;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpresses,
      child: Icon(iconss),
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      fillColor: Colors.grey,
    );
  }
}
