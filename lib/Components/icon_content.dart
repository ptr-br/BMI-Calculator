import 'package:flutter/material.dart';
import 'constants.dart';


class GenderCard extends StatelessWidget {
  GenderCard({@required this.genderText, @required this.genderIcon});

  final genderIcon;
  final genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
