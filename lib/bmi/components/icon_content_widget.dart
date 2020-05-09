import 'package:appbrewery/bmi/constants.dart';
import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContentWidget({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
