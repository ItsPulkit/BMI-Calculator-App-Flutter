import 'package:flutter/material.dart';

class card_content_icon extends StatelessWidget {
  final IconData card_icon;
  final String card_text;
  card_content_icon(this.card_icon, this.card_text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          card_icon,
          size: 80.0,
          color: Colors.black,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          card_text,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )
      ],
    );
  }
}
