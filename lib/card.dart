import 'package:flutter/material.dart';
import 'constants.dart';

class card extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  final Function onpress;
  card({@required this.colour, this.cardchild, this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
