import 'package:flutter/material.dart';
import 'constants.dart';

class QuestionContent extends StatelessWidget {
  QuestionContent({this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.center,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
