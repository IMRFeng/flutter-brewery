import 'package:appbrewery/bmi/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String btnLabel;
  final Function onTap;

  BottomButton({@required this.btnLabel, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
//              padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            btnLabel,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
